//
//  UCHistoryTableDataSource.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UCHistoryTableDataSource : NSObject<UITableViewDataSource>

/**
 *  重新刷新数据源，数据源会自动更细tableview
 */
-(void)reloadTableViewData;

/**
 *  删除所有历史信息,数据源会自动更新tableView
 */
-(void)deleteAllTableVieData;
@end
