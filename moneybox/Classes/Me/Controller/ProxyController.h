//
//  ModifyDateController.h
//  MolijieIos
//
//  Created by yexifeng on 16/6/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "BaseViewController.h"
#import "AddressSelectController.h"



@interface ProxyController : BaseViewController<AddressSelectDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnPCD;
@property (weak, nonatomic) IBOutlet UITextField *tfCompany;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfTel;
@property (weak, nonatomic) IBOutlet UITextField *tfIM;
@property (weak, nonatomic) IBOutlet UITextField *tfOwnDevice;
@property (weak, nonatomic) IBOutlet UITextField *tfOwnResource;
@property (weak, nonatomic) IBOutlet UITextField *tfScale;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
