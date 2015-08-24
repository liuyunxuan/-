//
//  UCBaseViewModel.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCBaseViewModel.h"
#import <UIKit/UIKit.h>
@interface UCBaseViewModel()<UIWebViewDelegate>

@end

@implementation UCBaseViewModel

#pragma something all moedl must done can be finished by fowlling method
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"update" object:nil];
    
    return [self UCWebView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self UCWebViewDidStartLoad:webView];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self UCWebViewDidFinishLoad:webView];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self UCWebView:webView didFailLoadWithError:error];
}

#pragma UCWebView 各自的代理方法
-(BOOL)UCWebView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)UCWebViewDidStartLoad:(UIWebView *)webView{
    
}

- (void)UCWebViewDidFinishLoad:(UIWebView *)webView{
    
}

- (void)UCWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}



@end
