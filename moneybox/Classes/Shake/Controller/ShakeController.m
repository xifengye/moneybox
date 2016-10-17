//
//  MGMessageViewController.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/5.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "ShakeController.h"
#import "MainController.h"
#import "UIImage+MG.h"


@interface ShakeController ()
@property(nonatomic,weak)UIImageView* topImageView;
@property(nonatomic,weak)UIImageView* bottomImageView;
@property(nonatomic,assign)CGSize imageSize;
@end

@implementation ShakeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
    
}



-(void)initView{
   
    
    self.view.backgroundColor = [UIColor colorWithRed:0.18039 green:0.188235 blue:0.188235 alpha:1];
    CGSize viewSize = self.view.frame.size;
    
    UIImage* logoImage = [UIImage imageNamed:@"AppIcon"];
    UIImageView* logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((viewSize.width-logoImage.size.width)/2, (viewSize.height-logoImage.size.height)/2, logoImage.size.width,logoImage.size.height)];
    logoImageView.image = logoImage;
    [self.view addSubview:logoImageView];
    
    
    UIImage* topImage = [UIImage imageNamed:@"shake_hand_top"];
    CGSize size = CGSizeMake(viewSize.width*0.7, topImage.size.height/topImage.size.width*viewSize.width*0.7);
    self.imageSize = size;
    topImage = [UIImage reSizeImage:topImage toSize:size];
    UIImageView* topImageView = [[UIImageView alloc] initWithFrame:CGRectMake((viewSize.width-topImage.size.width)/2, viewSize.height/2-topImage.size.height, topImage.size.width,topImage.size.height)];
    topImageView.image = topImage;
    [self.view addSubview:topImageView];
    self.topImageView = topImageView;
    
    UIImage* bottomImage = [UIImage imageNamed:@"shake_hand_bottom"];
    bottomImage = [UIImage reSizeImage:bottomImage toSize:size];
    UIImageView* bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake((viewSize.width-bottomImage.size.width)/2, viewSize.height/2-bottomImage.size.height+size.height-1, bottomImage.size.width,bottomImage.size.height)];
    bottomImageView.image = bottomImage;
    [self.view addSubview:bottomImageView];
    self.bottomImageView = bottomImageView;
}



-(void)initData{
    // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    // 并让自己成为第一响应者
    [self becomeFirstResponder];
}


#pragma mark - 摇一摇相关方法
// 摇一摇开始摇动
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"开始摇动");
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSLog(@"摇动结束");
        [self playAnimation];
    }
    return;
}

-(void)playAnimation{
    float during = 0.5f;
    float stayTime = 0.1f;
    float distance = self.imageSize.height*0.6;
    [UIView animateWithDuration:during animations:^{
        self.topImageView.transform = CGAffineTransformMakeTranslation(0, -distance);
        self.bottomImageView.transform =CGAffineTransformMakeTranslation(0, distance);
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:during delay:stayTime options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
            self.topImageView.transform = CGAffineTransformIdentity;
            self.bottomImageView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];

}


@end
