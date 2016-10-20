//
//  AddressController.m
//  MolijieIos
//
//  Created by yexifeng on 16/5/19.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "DevicesController.h"
#import "AppDataMemory.h"
#import "MLJConfig.h"
#import "UIImage+MG.h"
#import "AppDataTool.h"
#import "MBProgressHUD+MJ.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD+MJ.h"
#import "UIImageView+MG.h"

@implementation DevicesController
{
    NSString* scanResult;
    int areaId;
}
-(void)viewDidLoad{
    self.title = @"我的设备";
    [super viewDidLoad];
    UIColor* backgroudColor = MBBLUE_COLOR;
    [self.btnFindDevice setBackgroundColor:backgroudColor];
    [self.btnAddDevice setBackgroundColor:backgroudColor];
    [self initData];
}


-(void)initData{
    [[AppDataMemory instance] getMbUser:^(MBUser *mbUser) {
        self.nameView.text = mbUser.NickName;
        [self.IconView setImageWithURL:[NSURL URLWithString:mbUser.HeadPicUrl]];
        [self.IconView circle:MBBLUE_COLOR];
        [self requestDevices];
    }];
}

-(void)requestDevices{
    [AppDataTool requestDeviceList:^(NSArray *devices) {
        self.diviceNumberView.text = [NSString stringWithFormat:@"设备数量：%ld",devices.count];
        if(devices.count<=0){
            UILabel *emptyView = [[UILabel alloc] initWithFrame:self.tableview.frame];
            emptyView.text = @"未发现设备";
            emptyView.backgroundColor = [UIColor whiteColor];
            emptyView.textColor = [UIColor grayColor];
            emptyView.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:emptyView];
            
        }
    } onError:^(int code, NSString *msg) {
        [MBProgressHUD showError:msg];
    }];
}

-(void)didScanResult:(NSString*)result{
    scanResult = result;
    [self selectArea];
}

-(void)selectArea{
    NetAddressController* controller = [[NetAddressController alloc] init];
    controller.delegate = self;
    controller.parentId = 0;
    [self.navigationController pushViewController:controller animated:true];
}

-(void)didAddressSelected:(int)aid{
    areaId = aid;
    [self.navigationController popToViewController:self animated:true];
    [self performSelector:@selector(toActive) withObject:nil afterDelay:1.0f];
}

-(void)toActive{
    [AppDataTool activeDevice:@"vvenvp" flag:scanResult area:areaId response:^(NSString * result){
        
    } onError:^(int errorCode, NSString * msg) {
        [MBProgressHUD showError:msg];
    }];

}

- (IBAction)didAddDevice:(id)sender {
    [self didScanResult:@"80-80-34-ab-50"];
}


- (IBAction)didSearchDevice:(id)sender {
}

@end
