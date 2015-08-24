//
//  DataTool.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completeBlock) (BOOL done);

@interface HistoryObject : NSObject

@property(nonatomic, strong) NSString *url;
@property(nonatomic, strong) NSString *dateStr;

@end


@interface DataTool : NSObject

+ (instancetype)sharedInstance;
/**
 *  获得所有的数据
 */
- (NSArray *)getLastItemWithNum:(NSUInteger)num;

/**
 *  获得从n1到n2的数据，懒加载的情况下可用
 */
- (NSArray *)getItemsFromNum:(NSUInteger)from toNum:(NSUInteger)toNum;

/**
 *  获得所有的历史纪录
*/
- (NSArray *)getItems;

/**
 *  插入数据
 *
 */
- (void)insertHistory:(HistoryObject *)history com:(completeBlock)block;

/**
 * 删除某一条数据
 */
- (void)deleteHistory:(HistoryObject *)history com:(completeBlock)blocl;

/**
 *  删除所有的数据
 */
- (void)deleteAllHistory;

@end