//
//  UCBottomBar.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCBottomBar.h"

@interface UCBottomBar()

@property(strong, nonatomic)UIButton *backButton;

@property(strong, nonatomic)UIButton *forwardButton;

@property(strong, nonatomic)UIButton *historyButton;

@end

@implementation UCBottomBar

-(instancetype)init{
    if ([super init]) {
        [self constructView];
    }
    return self;
}

-(instancetype)initWithDelegate:(id< UCBottomBarDelegate>)delegate{
    _delegate = delegate;
    return  [self init];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    int width  = self.frame.size.width;
    int height = self.frame.size.height;
    int offset = 5;
    
    _backButton.frame = CGRectMake(offset, offset,
                                   height - 2*offset, height - 2*offset);
    _forwardButton.frame = CGRectMake(height + 2*offset, offset,
                                      height - offset, height - 2*offset);
   _historyButton.frame = CGRectMake(width - height - 2*offset, offset,
               height - 2*offset, height - 2*offset);

}

#pragma Public Method
-(void)setBackButtonAbled:(BOOL)abled{
    [self.backButton setEnabled:abled];
}
-(void)setForwardButtonAbled:(BOOL)abled{
    [self.forwardButton setEnabled:abled];
}

#pragma Private Method
-(void)constructView{
    _backButton = [[UIButton alloc]init];
    [_backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_backButton setTitle:@"<" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    
    _forwardButton = [[UIButton alloc]init];
    [_forwardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_forwardButton setTitle:@">" forState:UIControlStateNormal];
    [_forwardButton addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchDown];
    
    _historyButton  = [[UIButton alloc]init];
    [_historyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_historyButton setTitle:@"!!" forState:UIControlStateNormal];
    [_historyButton addTarget:self action:@selector(history) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:_backButton];
    [self addSubview:_forwardButton];
    [self addSubview:_historyButton];
}

-(void)back{
    if ([self.delegate respondsToSelector:@selector(backButtonDidSelected)]) {
        [self.delegate backButtonDidSelected];
    }
}

-(void)forward{
    if ([self.delegate respondsToSelector:@selector(forwardButtonDidSelected)]) {
        [self.delegate forwardButtonDidSelected];
    }
}

-(void)history{
    if ([self.delegate respondsToSelector:@selector(historyButtonDidSelected)]) {
        [self.delegate historyButtonDidSelected];
    }
}

@end
