//
//  DataTool.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "DataTool.h"
#import "FMDB.h"

@implementation HistoryObject


@end

static NSString * const DataBaseFileTitle = @"EventLogs.db";    // 数据库文件名

@interface DataTool()

@property (nonatomic, strong) FMDatabase *database;
@property (nonatomic, strong) FMDatabaseQueue *queue;

@end

@implementation DataTool

#pragma mark - public method

+ (instancetype)sharedInstance
{
    static DataTool * g_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_instance = [[DataTool alloc] init];
    });
    return g_instance;
}

- (NSArray *)getLastItemWithNum:(NSUInteger)num{
    NSMutableArray *mutabArray = [NSMutableArray array];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HistoryTable ORDER by id desc limited num"];
    FMResultSet * result = [_database executeQuery:sql];
    while([result next]) {
        HistoryObject *temp = [[HistoryObject alloc] init];
        temp.url = [result stringForColumn:@"webUrl"];
        temp.dateStr = [result stringForColumn:@"dateStr"];
        [mutabArray addObject:temp];
    }
    [result close];
    return [NSArray arrayWithArray:mutabArray];
}

-(NSArray *)getItems{
    NSMutableArray *mutabArray = [NSMutableArray array];
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM HistoryTable ORDER by id desc"];
    FMResultSet * result = [_database executeQuery:sql];
    while([result next]) {
        HistoryObject *temp = [[HistoryObject alloc] init];
        temp.url = [result stringForColumn:@"webUrl"];
        temp.dateStr = [result stringForColumn:@"dateStr"];
        [mutabArray addObject:temp];
    }
    [result close];
    return [NSArray arrayWithArray:mutabArray];
}

-(NSArray *)getItemsFromNum:(NSUInteger)from toNum:(NSUInteger)toNum{
    return nil;
}

- (void)insertHistory:(HistoryObject *)history com:(completeBlock)block
{
    [self insertItemWithNString:history.url dateStr:history.dateStr com:block];
}

- (void)deleteHistory:(HistoryObject *)history com:(completeBlock)block
{
    [self deleteItemWithNString:history.url dateStr:history.dateStr com:block];
}

-(void)deleteAllHistory{
    NSString *sql = @"delete from HistoryTable";
    [self.queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:sql];
    }];

}

#pragma mark - private method

-(instancetype)init
{
    if (self = [super init]) {
        [self readyDataBase];
    }
    return self;
}


- (void)insertItemWithNString:(NSString *)string dateStr:(NSString *)dateStr com:(completeBlock)block
{
    [self.queue inDatabase:^(FMDatabase *db) {
        BOOL a = [db executeUpdate:@"INSERT INTO HistoryTable (dateStr,webUrl) VALUES (?,?)",dateStr,string];
        if (block) {
             block(a);
        }
    }];
}

- (void)deleteItemWithNString:(NSString *)string dateStr:(NSString *)dateStr com:(completeBlock)block
{
    NSString *sql = [NSString stringWithFormat:@"DELETE FROM HistoryTable WHERE dateStr ='%@'", dateStr];
    [self.queue inDatabase:^(FMDatabase *db) {
        BOOL a = [db executeUpdate:sql];
        if (block) {
            block(a);
        }
    }];
}

#pragma mark - 数据库

- (void)readyDataBase
{
    _database = [FMDatabase databaseWithPath:[self dataFilePathName]];
    if (![_database open]) {
        return;
    }
    [self createTableInDB:_database];
}

- (NSString *)dataFilePathName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * dbfile = [documentsDirectory stringByAppendingPathComponent:DataBaseFileTitle];
    return dbfile;
}

- (void)createTableInDB:(FMDatabase *)database
{
    //会自动判断，若有已有则不会再创建
    [database executeUpdate:@"create table HistoryTable (id int IDENTITY(0,1)PRIMARY KEY,dateStr text ,webUrl text)"];
}

#pragma mark - getter&setter

- (FMDatabaseQueue *)queue
{
    if (!_queue) {
        _queue = [FMDatabaseQueue databaseQueueWithPath:[self dataFilePathName]];
    }
    return _queue;
}


@end
