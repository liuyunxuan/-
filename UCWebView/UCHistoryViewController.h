//
//  UCHistoryViewController.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

//你可以将代理设置成webviewController，点击哪一行的cell他就会自动加载那条URL的网页
@protocol UCHistoryViewControllerDelegate <NSObject>

-(void)historyViewSelecterURL:(NSString *)urlString;

@end

@interface UCHistoryViewController : UIViewController

@property (nonatomic ,strong)id<UCHistoryViewControllerDelegate>delegate;

@end
