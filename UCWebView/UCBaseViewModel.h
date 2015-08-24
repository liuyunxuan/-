//
//  UCBaseViewModel.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UCBaseViewModelProtocol

@optional
-(BOOL)UCWebView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)UCWebViewDidStartLoad:(UIWebView *)webView;
- (void)UCWebViewDidFinishLoad:(UIWebView *)webView;
- (void)UCWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
@end

@interface UCBaseViewModel : NSObject

@end
