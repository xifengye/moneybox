//
//  UIButton+MG.m
//  moneybox
//
//  Created by yexifeng on 16/10/16.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import "UIButton+MG.h"


@implementation UIButton (MG)
+(UIButton *)buttonWithRoundedRectStyle:(NSString *)title cornerRadius:(float)radius{
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:radius];
    [btn setBackgroundColor:[UIColor colorWithRed:0 green:0.58431 blue:0.94901 alpha:1]];
    [btn setTitle:title forState:UIControlStateNormal];
    return btn;
}
@end
