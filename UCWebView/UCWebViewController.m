//
//  UCWebViewController.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCWebViewController.h"
#import "UCHistoryViewController.h"
#import "UCTopBar.h"
#import "UCBottomBar.h"
#import "UCTool.h"
#import "DataTool.h"
#import <UIKit/UIKit.h>

@interface UCWebViewController ()<UCTopBarDelegate,UCBottomBarDelegate,UIWebViewDelegate>

@property (nonatomic, strong)UIWebView   *webView;
@property (nonatomic, strong)UCTopBar    *topBar;
@property (nonatomic, strong)UCBottomBar *bottmBar;

@end

@implementation UCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self construstView];
    [self constructUI];
}

-(void)construstView{
    self.topBar  = [[UCTopBar alloc]initWithDelegate:self];
    self.webView = [[UIWebView alloc]init];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    self.bottmBar = [[UCBottomBar alloc]initWithDelegate:self];
    
    [self.view addSubview:_topBar];
    [self.view addSubview:_webView];
    [self.view addSubview:_bottmBar];
}

-(void)constructUI{
    int width  = self.view.frame.size.width;
    int height = self.view.frame.size.height;
    self.topBar.frame = CGRectMake(0, 0, width, 50);
    self.bottmBar.frame = CGRectMake(0, height - 50, width, 50);
    self.webView.frame = CGRectMake(0, 50, width, height - 100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UCWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if(navigationType != UIWebViewNavigationTypeBackForward){
        HistoryObject *object = [[HistoryObject alloc]init];
        object.url = request.URL.absoluteString;
        object.dateStr = [UCTool stringFromDate:[NSDate date]];
        [[DataTool sharedInstance]insertHistory:object com:nil];
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.bottmBar setBackButtonAbled:webView.canGoBack];
    [self.bottmBar setForwardButtonAbled:webView.canGoForward];
    [self.topBar setImageViewWithRequest:webView.request];
}

#pragma UCTopBarDelegate
-(void)goButoonDidSelected:(NSURLRequest *)requeset{
    [self.webView loadRequest:requeset];
}

#pragma UCBottomBarDelegate
-(void)backButtonDidSelected{
    [self.webView goBack];
}

-(void)forwardButtonDidSelected{
    [self.webView goForward];
}

-(void)historyButtonDidSelected{
    UCHistoryViewController *historyViewController = [[UCHistoryViewController alloc]init];
    [self presentViewController:historyViewController animated:YES completion:nil];
}

#pragma method


@end
