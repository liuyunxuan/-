//
//  UCTool.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/19.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCTool.h"

@implementation UCTool
//判断输入的网址
+ (NSString * )judgeUrlString:(NSString *)str
{
    NSRange range = [str rangeOfString:@"www." options:NSCaseInsensitiveSearch];
    NSRange rangeh = [str rangeOfString:@"http://" options:NSCaseInsensitiveSearch];
    NSString * string = nil;
    if (range.length > 0 && (range.location ==0 || range.location == 7)) {
        NSString * subString = [str substringFromIndex:range.location];
        string = [@"http://" stringByAppendingString:subString];   //获取网址字符串
    } else if(range.length == 0 && rangeh.length == 0){
        string = [@"http://www." stringByAppendingString:str];
    } else if (rangeh.length > 0 && range.length == 0) {
        NSString * subString = [str substringFromIndex:rangeh.location+rangeh.length];
        string = [@"http://www." stringByAppendingString:subString];
    }
    else {
        string = str;
    }
    NSRange rangCom = [string rangeOfString:@".com" options:NSCaseInsensitiveSearch];
    if (rangCom.length > 0) {
        //有.com
        NSLog(@"sss");
    } else {
        if ([string hasSuffix:@".co"]) {
            string = [string stringByAppendingString:@"m"];
        } else {
            NSLog(@"lll");
            if ([string hasSuffix:@".c"]) {
                string = [string stringByAppendingString:@"om"];
            }else {
                //判断末尾是否有点
                if ([string hasSuffix:@"."]) {
                    string = [string stringByAppendingString:@"com"];
                } else {
                    string = [string stringByAppendingString:@".com"];
                }
            }
        }
    }
    return string;
}

+(NSString *)judgeIconWithString:(NSString *)str{
    NSRange range = [str rangeOfString:@".com" options:NSCaseInsensitiveSearch];
    NSString *string ;
    if (range.length > 0) {
        NSString * subString = [str substringToIndex:range.location];
        string = [subString stringByAppendingString:@".com.cn/favicon.ico"];
    }
    return string;
}

+(NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}




@end
