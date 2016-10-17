//
//  MGMeCellView.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/30.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "MGMeCellView.h"
#import "MLJConfig.h"

@implementation MGMeCellView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self) {
        self.backgroundColor = MBBLUE_COLOR;
        CGFloat imageY = 15;
        CGFloat imageHeight = 80;
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake((frame.size.width-imageHeight)/2, imageY, imageHeight, imageHeight);
        imageView.image = [UIImage imageNamed:@"AppIcon"];
        [self addSubview:imageView];
        self.iconView = imageView;
        
        UILabel* nameLabel = [[UILabel alloc]init];
        self.nameLabel = nameLabel;
        nameLabel.text = @"疯子小助手";
        [self addSubview:nameLabel];
        
        UIFont* nameFont = [UIFont fontWithName:@"Helvetica-Bold"  size:(18.0)];
        nameLabel.font = nameFont;
        CGSize nameSize = [nameLabel.text sizeWithFont:nameFont];
        CGFloat nameY = CGRectGetMaxY(imageView.frame)+10;
        nameLabel.frame = CGRectMake(0,nameY,frame.size.width,nameSize.height);
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}

@end
