//
//  UCHistoryViewController.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCHistoryViewController.h"
#import "UCHistoryTableDataSource.h"

@interface UCHistoryViewController()

@property (strong ,nonatomic)UIButton *closeButton;
@property (strong ,nonatomic)UIButton *clearButton;
@property (strong ,nonatomic)UITableView *tableView;
@property (strong ,nonatomic)UCHistoryTableDataSource *dataSource;

@end

static NSString *historyCellID = @"HistoryCellID";

@implementation UCHistoryViewController

-(void)viewDidLoad{
    [self constructView];
    [self constructUI];
    _dataSource = [[UCHistoryTableDataSource alloc]init];
    _tableView.dataSource = _dataSource;

}

-(void)constructView{
    _closeButton = [[UIButton alloc]init];
    [_closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchDown];
    
    _clearButton = [[UIButton alloc]init];
    [_clearButton addTarget:self action:@selector(clearData) forControlEvents:UIControlEventTouchDown];
    
    _tableView   = [[UITableView alloc]init];
    
    [self.view addSubview:_closeButton];
    [self.view addSubview:_clearButton];
    [self.view addSubview:_tableView];
}

-(void)constructUI{
    int offset = 5;
    int width = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    
    //layout
    _closeButton.frame = CGRectMake(offset, offset, 40, 30);
    _clearButton.frame = CGRectMake(width - offset - 30 , offset, 40, 30);
    _tableView.frame   = CGRectMake(0, 40, width, height - 40);
    
    //setUIContent
    self.view.backgroundColor = [UIColor whiteColor];
    [_closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    
    [_clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_clearButton setTitle:@"清除" forState:UIControlStateNormal];
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)clearData{
    [self.dataSource deleteAllTableVieData];
}

@end
