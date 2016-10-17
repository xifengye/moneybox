//
//  SinaLoginController.h
//  SinaWeibo
//
//  Created by yexifeng on 15/11/13.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Token.h"
#import "WXApi.h"

@interface LoginController : UIViewController<UIScrollViewDelegate,WXApiDelegate>
@property(nonatomic,retain) UIPageControl* pageControl;



@end
