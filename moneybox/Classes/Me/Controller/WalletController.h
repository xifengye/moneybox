//
//  AddressEditController.h
//  MolijieIos
//
//  Created by yexifeng on 16/6/9.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "BaseViewController.h"

@interface WalletController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfMobile;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnPCD;
@property (weak, nonatomic) IBOutlet UITextField *tfDetail;
@property (weak, nonatomic) IBOutlet UITextField *tfPostCode;
@property (weak, nonatomic) IBOutlet UISwitch *btnDefault;

@end
