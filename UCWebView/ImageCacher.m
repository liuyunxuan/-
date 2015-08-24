//
//  ImageCacher.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "ImageCacher.h"

@implementation ImageCacher

+ (instancetype)sharedInstance
{
    static ImageCacher *g_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_instance = [[ImageCacher alloc] init];
    });
    return g_instance;
}

- (void)storeImage:(UIImage *)image withUrl:(NSString *)url
{
    NSData *data = UIImagePNGRepresentation(image);
    [self setObject:data forKey:url];
}

- (UIImage *)imageFromCacheWithUrl:(NSString *)url;
{
    UIImage *image;
    NSData *data = [self objectForKey:url];
    image = [UIImage imageWithData:data];
    return image;
}

@end
