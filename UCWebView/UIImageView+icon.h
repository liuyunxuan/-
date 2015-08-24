//
//  UIImageView+icon.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^compeletBlock) (UIImage *image);

@interface UIImageView (icon)

- (void)setImageWithUrlString:(NSString *)url completeBlock:(compeletBlock)block;

@end
