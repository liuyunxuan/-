//
//  UCHistoryTableDataSource.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCHistoryTableDataSource.h"
#import "DataTool.h"

@interface UCHistoryTableDataSource()

@property(strong, nonatomic)NSMutableArray *itemArray;

@property(weak  , nonatomic)UITableView    *tableView;

@end

static NSString * const historyCellID = @"HistoryCellID";

@implementation UCHistoryTableDataSource

-(instancetype)init{
    if ([super init]) {
        NSArray *array = [[DataTool sharedInstance]getItems];
        _itemArray = [NSMutableArray arrayWithArray:array];
    }
    return self;
}

#pragma tableviewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!_tableView) {
        _tableView = tableView;
    }
    return _itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:historyCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:historyCellID];
    }
    HistoryObject *object =_itemArray[indexPath.row];
    cell.textLabel.text = object.dateStr;
    cell.detailTextLabel.text = object.url;
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
        HistoryObject *object = [_itemArray objectAtIndex:indexPath.row];
        [[DataTool sharedInstance] deleteHistory:object com:^(BOOL done) {
            if(done == YES)
            {
                [_itemArray removeObject:object];
                [_tableView reloadData];
            }
        }];
}

#pragma public method

-(void)reloadTableViewData{
    NSArray *array = [[DataTool sharedInstance]getItems];
    _itemArray = [NSMutableArray arrayWithArray:array];
    [self.tableView reloadData];
}

-(void)deleteAllTableVieData{
    [[DataTool sharedInstance] deleteAllHistory];
    [self reloadTableViewData];
}



@end
