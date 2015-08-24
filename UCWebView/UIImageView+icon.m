//
//  UIImageView+icon.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UIImageView+icon.h"
#import "ImageCacher.h"
#import <objc/runtime.h>

static char * const GCDQUEUEKEY = "HAHAHATUPIANHUANCUN";

//static char * imageKey;

@implementation UIImageView (icon)


- (void)setImageWithUrlString:(NSString *)url completeBlock:(compeletBlock)block
{
    UIImage *img = [[ImageCacher sharedInstance] imageFromCacheWithUrl:url];
    if (img) {
        self.image = img;
        if (block) {
            block(img);
        }
        [self setImage:img];
        return;
    }
    NSURL *realUrl = [NSURL URLWithString:url];
    dispatch_async(self.queueToDownLoadImage, ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:realUrl];
        NSURLResponse *reponse = nil;
        NSError *error = nil;
        NSData *data =  [NSURLConnection sendSynchronousRequest:request returningResponse:&reponse error:&error];
        UIImage *temp = [UIImage imageWithData:data];
        //objc_setAssociatedObject(self, &imageKey, temp, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        if (temp) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[ImageCacher sharedInstance] storeImage:temp withUrl:url];
                [self setImage:temp];
                [self setNeedsLayout];
                if(block){
                    block(temp);
                }
            });
        }
    });
}


- (dispatch_queue_t)queueToDownLoadImage
{
    dispatch_queue_t queue = dispatch_queue_create(GCDQUEUEKEY, DISPATCH_QUEUE_SERIAL);
    return queue;
}

@end
