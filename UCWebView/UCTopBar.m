//
//  UCTopBar.m
//  UCWebView
//
//  Created by liuyunxuan on 15/7/18.
//  Copyright (c) 2015年 liuyunxuan. All rights reserved.
//

#import "UCTopBar.h"
#import "UCTool.h"
#import "UIImageView+icon.h"

@interface UCTopBar()

@property (nonatomic ,strong)UITextField *field;
@property (nonatomic ,strong)UIButton    *goButton;
@property (nonatomic ,strong)UIImageView *imageView;

@end

@implementation UCTopBar

-(instancetype)init{
    if ([super init]) {
        [self constructView];
    }
    return self;
}

-(instancetype)initWithDelegate:(id< UCTopBarDelegate>)delegate{
    _delegate = delegate;
    return  [self init];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    int width  = self.frame.size.width;
    int height = self.frame.size.height;
    int offset = 5;
    
    _imageView.frame = CGRectMake(5, 5, height - 5, height - 5);
    _field.frame     = CGRectMake(height + 2*offset, offset, width - 2 *(height +2*offset), height);
    _goButton.frame  = CGRectMake(width - height - offset, offset, height - 5, height - 5);
    [_goButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_goButton setTitle:@"Go" forState:UIControlStateNormal];
}

-(void)constructView{
    _imageView = [[UIImageView alloc]init];
    _field     = [[UITextField alloc]init];
    _goButton  = [[UIButton alloc]init];
    [_goButton addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchDown];

    [self addSubview:_imageView];
    [self addSubview:_field];
    [self addSubview:_goButton];
}

-(void)go{
    NSString *urlString = [UCTool judgeUrlString:self.field.text];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    if ([self.delegate respondsToSelector:@selector(goButoonDidSelected:)]){
        [self.delegate goButoonDidSelected:urlRequest];
    };
}

-(void)setImageViewWithRequest:(NSURLRequest *)request{
    NSURL *url = request.URL;
    NSString *urlString = url.absoluteString;
    NSString *handleString = [UCTool judgeIconWithString:urlString];
    [self.imageView setImageWithUrlString:handleString completeBlock:nil];
}

@end
