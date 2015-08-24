//
//  UCTool.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/19.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UCTool : NSArray

/**
 *  判断输入的网址
 *
 *  @param str 输入框网址
 *
 *  @return 自动补全的网址
 */
+ (NSString * )judgeUrlString:(NSString *)str;

/**
 *  自动补全图片网址
 *
 *  @param str 原网站网址
 *
 *  @return 可以访问icon网址
 */
+(NSString *)judgeIconWithString:(NSString *)str;

/**
 *  将日期转换成文字
 *
 *  @param date 日期
 *
 *  @return 返回的日期文字
 */
+(NSString *)stringFromDate:(NSDate *)date;

@end
