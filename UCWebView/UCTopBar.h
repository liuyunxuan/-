//
//  UCTopBar.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UCTopBarDelegate<NSObject>

-(void)goButoonDidSelected:(NSURLRequest *)requeset;

@end

@interface UCTopBar : UIView

@property(nonatomic ,weak)id<UCTopBarDelegate>delegate;

-(instancetype)initWithDelegate:(id< UCTopBarDelegate>)delegate;

-(void)setImageViewWithRequest:(NSURLRequest *)request;

@end
