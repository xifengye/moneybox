//
//  NetAddressControllerViewController.m
//  moneybox
//
//  Created by yexifeng on 16/10/17.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import "NetAddressController.h"
#import "AppDataTool.h"
#import "MJExtension.h"
#import "NetAddress.h"


@interface NetAddressController ()
@property(nonatomic,weak)UITableView* tableView;
@property(nonatomic,strong)NSArray* netAddresses;
@property(nonatomic,assign)int areaId;
@end

@implementation NetAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self initData];
}

-(void)initView{
    
    CGRect frame = [self.view bounds];
    UITableView* tableView = [[UITableView alloc]initWithFrame:frame];
    self.tableView =tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
}

-(void)initData{
    [self requestData];
}

-(void)requestData{
    [AppDataTool requestNetAddress:self.parentId response:^(NSArray* result) {
        self.netAddresses = [NetAddress objectArrayWithKeyValuesArray:result];
        if(self.netAddresses.count>0){
            [self.tableView reloadData];
        }else{
            self.areaId = -1;
            [self selectOver];
        }
    } onError:^(int errorCode, NSString *msg) {
        
    }];
}

-(void)selectOver{
    [self.navigationController popViewControllerAnimated:true];
    if(self.delegate && [self.delegate respondsToSelector:@selector(didAddressSelected:)]){
        [self.delegate didAddressSelected:_areaId];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.netAddresses.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* ID = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NetAddress* address = [self.netAddresses objectAtIndex:indexPath.row];
    cell.textLabel.text= address.Name;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NetAddress* address = [self.netAddresses objectAtIndex:indexPath.row];
    if(address){
        self.areaId = address.DataID;
        NetAddressController* controller = [[NetAddressController alloc] init];
        controller.delegate = self;
        controller.parentId = address.DataID;
        controller.title = address.Name;
        [self.navigationController pushViewController:controller animated:true];
    }
}

-(void)didAddressSelected:(int)areaId{
    if(areaId>0){
        self.areaId = areaId;
    }
    [self selectOver];
}

-(void)cancel{
    [self.navigationController popViewControllerAnimated:true];
}

@end
