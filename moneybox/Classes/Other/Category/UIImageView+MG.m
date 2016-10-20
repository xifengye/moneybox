//
//  UIImageView+MG.m
//  moneybox
//
//  Created by yexifeng on 16/10/20.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import "UIImageView+MG.h"

@implementation UIImageView (MG)
-(void)circle:(UIColor*)borderColor{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width*0.5f;
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = borderColor.CGColor;
}

@end
