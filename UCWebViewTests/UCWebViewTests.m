//
//  UCWebViewTests.m
//  UCWebViewTests
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DataTool.h"

@interface UCWebViewTests : XCTestCase

@end

@implementation UCWebViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//  测试fmdb
    HistoryObject *object = [[HistoryObject alloc] init];
    object.url = @"http://www.baidu.com";
    object.dateStr = @"asdasd";
    [[DataTool sharedInstance] insertHistory:object com:nil];
    NSArray *a = [[DataTool sharedInstance] getItems];
    HistoryObject *b = a[0];
    [[DataTool sharedInstance] deleteHistory:b com:nil];
    a = [[DataTool sharedInstance] getLastItemWithNum:1];
    
//
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
