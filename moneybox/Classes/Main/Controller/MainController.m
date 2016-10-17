//
//  ViewController.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/4.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "MainController.h"
#import "YouLeMeiController.h"
#import "TreasureHuntController.h"
#import "ShakeController.h"
#import "MGNavigationController.h"
#import "MeController.h"
#import "MGTabBar.h"
#import "AppDataTool.h"
#import "SandBoxTool.h"
#import "AppDataMemory.h"


@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCustomTabBar];
    [self initViews];
    [self initData];
    
}


-(void)initData{
    [self requestData];
    [self updateBadge];
}


-(void)requestData{
    
}


-(void)updateBadge{
    [self updateCartBadge];
}

-(void)updateCartBadge{
}

- (void) onLocalOrderChange:(NSNotification*) notification{
   [self updateCartBadge];
}


//View 被显示之时调用
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIView* childView in self.tabBar.subviews) {
        if([childView isKindOfClass:[UIControl class]]){
            [childView removeFromSuperview];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)initViews{
    TreasureHuntController* treasureHuntController = [[TreasureHuntController alloc] init];
    YouLeMeiController* youLeMeiController = [[YouLeMeiController alloc] init];
    ShakeController* shakeController = [[ShakeController alloc] init];
    MeController* meController = [[MeController alloc] init];
    
    [self addTabController:treasureHuntController tabTitle:@"寻宝" tabImage:@"main_tab1_unselected" tableSelectImage:@"main_tab1_selected"];
    [self addTabController:shakeController tabTitle:@"摇一摇" tabImage:@"main_tab2_unselected" tableSelectImage:@"main_tab2_selected"];
    [self addTabController:youLeMeiController tabTitle:@"优乐美" tabImage:@"main_tab3_unselected" tableSelectImage:@"main_tab3_selected"];
    [self addTabController:meController tabTitle:@"我" tabImage:@"main_tab4_unselected" tableSelectImage:@"main_tab4_selected"];

}

-(void)initCustomTabBar{
    for(UIView* view in self.tabBar.subviews){
        [view removeFromSuperview];
    }
    MGTabBar* customTabBar = [[MGTabBar alloc] initWithFrame:self.tabBar.bounds];
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
    self.customTabBar.delegate = self;
}


-(void)addTabController:(UIViewController*)tabViewController tabTitle:(NSString*)title tabImage:(NSString*)imageName tableSelectImage:(NSString*)selectImageName{
    tabViewController.title = title;
//    tabViewController.tabBarItem.badgeValue = @"XX";
    //controller.title = title 等效于controller.tabBarItem.title = title;controller.nagivationItem.title = title;
    UIImage* image = [UIImage imageNamed:imageName];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabViewController.tabBarItem.image = image;
    UIImage* selectImage = [UIImage imageNamed:selectImageName];
    [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabViewController.tabBarItem.selectedImage = selectImage;
    MGNavigationController* navigationController = [[MGNavigationController alloc] initWithRootViewController:tabViewController];
    [self addChildViewController:navigationController];
    [self.customTabBar addTabItem:tabViewController.tabBarItem];

}

- (void)tabBar:(MGTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}

-(void)swtichTab:(int)index{
    [_customTabBar selectByIndex:index];
}

-(void)tabBarDidClickedPlusButton:(MGTabBar *)tabBar{
   
}

@end
