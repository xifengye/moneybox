//
//  MGMeViewController.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/5.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "MeController.h"
#import "MGMeCellView.h"
#import "DevicesController.h"
#import "AppDataMemory.h"
#import "BindPhoneController.h"
#import "WalletController.h"
#import "ProxyController.h"
#import "AppDataTool.h"
#import "MLJConfig.h"
#import "MBProgressHUD+MJ.h"
#import "SettingController.h"



@interface MeController ()

@end

@implementation MeController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.tableView.showsVerticalScrollIndicator = false;
    }
    return self;
}
- (void)viewDidLoad {
    NSLog(@"controller width = %f",self.view.frame.size.width);
    [super viewDidLoad];
    [self setupSettingView];
}


-(void)setupSettingView{
    MGMeCellView* headerView = [[MGMeCellView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, CELL_HEIGHT)];
     self.tableView.tableHeaderView = headerView;
    __block MeController* blockSelf = self;

    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.imageView.image = [UIImage imageNamed:@"ico_bind_mobile"];
            cell.textLabel.text = @"绑定手机";
        } whenSelected:^(NSIndexPath *indexPath) {
            BindPhoneController* controller = [[BindPhoneController alloc]init];
            [blockSelf.navigationController pushViewController:controller animated:YES];
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.imageView.image = [UIImage imageNamed:@"ico_my_device"];
            cell.textLabel.text = @"我的设备";
        } whenSelected:^(NSIndexPath *indexPath) {
            DevicesController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DevicesController"];
            [blockSelf.navigationController pushViewController:controller animated:YES];

        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.imageView.image = [UIImage imageNamed:@"ico_wallet"];
            cell.textLabel.text = @"我的钱包";
        } whenSelected:^(NSIndexPath *indexPath) {
            WalletController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"WalletController"];
            [blockSelf.navigationController pushViewController:controller animated:YES];
            
        }];
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.imageView.image = [UIImage imageNamed:@"ico_proxy"];
            cell.textLabel.text = @"申请代理";
        } whenSelected:^(NSIndexPath *indexPath) {
            ProxyController* controller = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ProxyController"];
            [blockSelf.navigationController pushViewController:controller animated:YES];
            
        }];



    }];
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.imageView.image = [UIImage imageNamed:@"ico_setting"];
            cell.textLabel.text = @"设置";
        } whenSelected:^(NSIndexPath *indexPath) {
            SettingController* controller = [[SettingController alloc] init];
            [blockSelf.navigationController pushViewController:controller animated:YES];

        }];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)alertTip:(NSString*)title msg:(NSString*)msg cancelActionTitle:(NSString*)cancelTitle  okActionTitle:(NSString*)okTitle okHandler:(UIActionHandler)okHandler{
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:okTitle style:UIAlertActionStyleDefault handler:okHandler];
    [alertController addAction:okAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)goAppStore{
    NSLog(@"goAppStore");
}


@end
