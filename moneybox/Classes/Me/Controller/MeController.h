//
//  MGMeViewController.h
//  SinaWeibo
//
//  Created by yexifeng on 15/11/5.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMStaticContentTableViewController.h"
#import "MGMeCellView.h"

@interface MeController : JMStaticContentTableViewController
@property(nonatomic,weak)MGMeCellView* meView;
@end
