//
//  ImageCacher.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageCacher : NSCache

+ (instancetype)sharedInstance;

- (void)storeImage:(UIImage *)image withUrl:(NSString *)url;

- (UIImage *)imageFromCacheWithUrl:(NSString *)url;

@end
