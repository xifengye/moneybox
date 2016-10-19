//
//  AddressEditController.m
//  MolijieIos
//
//  Created by yexifeng on 16/6/9.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "WalletController.h"
#import "AppDataMemory.h"
#import "AppDataTool.h"
#import "MLJConfig.h"
#import "MBProgressHUD+MJ.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "WalletRecord.h"


@interface WalletController()<MJRefreshBaseViewDelegate>
@property(nonatomic,strong)NSMutableArray* bankLogs;
@property(nonatomic,strong)MJRefreshFooterView* footerView;
@end


@implementation WalletController{
    int _pageIndex;
    ArrayResultBlock _bankLogResult;

}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"我的钱包";
    [self initView];
    [self initData];
}

-(void)initView{
    [self.btnTakeCash setTitleColor:MBBLUE_COLOR forState:UIControlStateNormal];
    [self.btnTakeCash.layer setBorderWidth:2.0f];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){0,149.0/255,242.0/255,1});
    [self.btnTakeCash.layer setBorderColor:color];
    
    MJRefreshFooterView* footerView = [MJRefreshFooterView footer];
    footerView.scrollView = self.tableView;
    footerView.delegate = self;
    footerView.tag = 2;
    self.footerView = footerView;
   

}

-(void)initData{
    _pageIndex = 1;
    _bankLogs = [NSMutableArray array];
    __block WalletController* blockSelf = self;
    _bankLogResult = ^(NSArray *result) {
        if([blockSelf.footerView isRefreshing]){
            [blockSelf.footerView endRefreshing];
        }
        [blockSelf.bankLogs addObjectsFromArray:result];
        [blockSelf.tableView reloadData];
    };
    [[AppDataMemory instance] getMbUser:^(MBUser *mbUser) {
        self.nameView.text = [NSString stringWithFormat:@"%@的余额",mbUser.NickName];
        self.blanceView.text = [NSString stringWithFormat:@"%.2f元",mbUser.Bank];
        self.alreadyTakeCashView.text = [NSString stringWithFormat:@"累计已提现%.2f元",mbUser.S_Money];
        [self.iconView setImageWithURL:[NSURL URLWithString:mbUser.HeadPicUrl]];
         [self.footerView beginRefreshing];
    }];

}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView{
    _pageIndex++;
    [self requestBankLog];
}


-(void)requestBankLog{
    [AppDataTool requestBankLog:_pageIndex response:_bankLogResult onError:^(int errorCode, NSString *msg) {
        if([self.footerView isRefreshing]){
            [self.footerView endRefreshing];
        }
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bankLogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    WalletRecord* address = [self.bankLogs objectAtIndex:indexPath.row];
    cell.textLabel.text= [NSString stringWithFormat:@"%.2f",address.Balance];
    cell.detailTextLabel.text = address.CreatedDT;
    return cell;
}

@end
