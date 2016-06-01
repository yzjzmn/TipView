//
//  TipView.h
//  GuQu
//
//  Created by HELIUM STAR on 15/6/25.
//  Copyright (c) 2015年 HELIUM STAR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipView : UIView

@property (strong, nonatomic) UIImage *tipImage;
@property (strong, nonatomic) NSString *tipText;

+ (TipView *)showToView:(UIView *)view tipImage:(UIImage *)tipImage tipText:(NSString *)textText;
+ (TipView *)showToView:(UIView *)view tipText:(NSString *)textText;


@end
