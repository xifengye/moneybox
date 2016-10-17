//
//  MGImageLableView.m
//  MolijieIos
//
//  Created by yexifeng on 16/7/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "MGImageLableView.h"

@implementation MGImageLableView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        UILabel* labelView = [[UILabel alloc] init];
        self.labelView = labelView;
        labelView.backgroundColor = [UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:0.8f];
        labelView.textAlignment = NSTextAlignmentCenter;
        labelView.textColor = [UIColor whiteColor];
        labelView.font = [UIFont systemFontOfSize:11];
        CGFloat height = 20;
        labelView.frame = CGRectMake(0, frame.size.height-height, frame.size.width, height);
        [self addSubview:labelView];
    }
    return self;
}

-(void)setLabeText:(NSString *)text{
    _labelView.text = text;
}

@end
