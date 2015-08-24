//
//  UCGoViewModel.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCGoViewModel.h"
#import "DataTool.h"

@implementation UCGoViewModel
-(BOOL)UCWebView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    DataTool *tool = [DataTool sharedInstance];
    HistoryObject *object = [[HistoryObject alloc]init];
    object.url = request.URL.absoluteString;
    [tool insertHistory:object com:nil];

    return true;
}
- (void)UCWebViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)UCWebViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)UCWebView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
@end
