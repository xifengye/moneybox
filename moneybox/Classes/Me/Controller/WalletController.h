//
//  AddressEditController.h
//  MolijieIos
//
//  Created by yexifeng on 16/6/9.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "BaseViewController.h"

@interface WalletController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *blanceView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIButton *btnTakeCash;
@property (weak, nonatomic) IBOutlet UILabel *alreadyTakeCashView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
