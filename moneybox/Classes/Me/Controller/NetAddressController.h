//
//  NetAddressControllerViewController.h
//  moneybox
//
//  Created by yexifeng on 16/10/17.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NetAddressSelectedDelegate <NSObject>

@optional
-(void)didAddressSelected:(int)areaId;

@end

@interface NetAddressController : UIViewController<NetAddressSelectedDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)id<NetAddressSelectedDelegate> delegate;
@property(nonatomic,assign)int parentId;

@end
