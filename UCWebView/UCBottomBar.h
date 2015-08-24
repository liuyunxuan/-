//
//  UCBottomBar.h
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UCBottomBarDelegate<NSObject>

-(void)forwardButtonDidSelected;

-(void)backButtonDidSelected;

-(void)historyButtonDidSelected;

@end

@interface UCBottomBar : UIView

@property(nonatomic ,weak)id<UCBottomBarDelegate>delegate;

-(instancetype)initWithDelegate:(id< UCBottomBarDelegate>)delegate;

-(void)setBackButtonAbled:(BOOL)abled;

-(void)setForwardButtonAbled:(BOOL)abled;

@end
