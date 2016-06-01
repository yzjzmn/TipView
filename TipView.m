//
//  TipView.m
//  GuQu
//
//  Created by HELIUM STAR on 15/6/25.
//  Copyright (c) 2015年 HELIUM STAR. All rights reserved.
//

#import "TipView.h"

#define UIColorFromRGB(rgbValue)                            \
[UIColor                                                    \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0   \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0             \
blue:((float)(rgbValue & 0xFF))/255.0                       \
alpha:1.0]

#define kImageMargin 15

@interface TipView ()

@property (strong, nonatomic) UIView *coverView;

@end

@implementation TipView


- (void)setTipText:(NSString *)tipText
{
    _tipText = tipText;
    [self setUpTipImageAndLabel];
}

- (void)setUpTipImageAndLabel
{
    CGFloat labelHeight = 24;
    CGFloat containMargin = 30;
    
    CGFloat containWidth = kScreenWidth / 3;
    CGFloat containHeight = 40;
    CGFloat containX = kScreenWidth / 2 - containWidth / 2;
    CGFloat containY = containMargin;
    
    UIView *containView = [[UIView alloc] initWithFrame:CGRectMake(containX, containY - 150, containWidth, containHeight)];
    containView.layer.masksToBounds = YES;
    containView.layer.cornerRadius = 5;
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 8, containView.width, labelHeight)];
    tipLabel.text = _tipText;
    tipLabel.font = [UIFont systemFontOfSize:13];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    containView.backgroundColor = kColorDarkText;
    containView.alpha = 0.7;
    
    [containView addSubview:tipLabel];
    [self addSubview:containView];
    
}

+ (TipView *)showToView:(UIView *)view tipImage:(UIImage *)tipImage tipText:(NSString *)tipText
{
    TipView *tipView = [[self alloc] initWithFrame:CGRectMake(0, 100 * kVRate, kScreenWidth, kScreenHeight - kNavHeight)];
    tipView.tipImage = tipImage;
    tipView.tipText = tipText;
    [view addSubview:tipView];
    
    //修改了提示框的停留时间  0.7秒最好
    [TipView animateWithDuration:0.5 delay:0.7 options:0 animations:^{
        tipView.alpha = 0;
    } completion:^(BOOL finished) {
        [tipView removeFromSuperview];
    }];
    
    return tipView;
}


+ (TipView *)showToView:(UIView *)view tipText:(NSString *)tipText
{
    TipView *tipView = [[self alloc] initWithFrame:CGRectMake(0, kScreenHeight - 240, kScreenWidth, 40)];
    
    tipView.tipText = tipText;
    [view addSubview:tipView];
    //修改了提示框的停留时间  0.7秒最好
    [TipView animateWithDuration:0.5 delay:0.7 options:0 animations:^{
        tipView.alpha = 0;
    } completion:^(BOOL finished) {
        [tipView removeFromSuperview];
    }];
    
    return tipView;
}



@end
