//
//  AddressController.h
//  MolijieIos
//
//  Created by yexifeng on 16/5/19.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "BaseViewController.h"

@interface DevicesController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *IconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *diviceNumberView;

@property (weak, nonatomic) IBOutlet UIButton *btnFindDevice;

@property (weak, nonatomic) IBOutlet UIButton *btnAddDevice;

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
