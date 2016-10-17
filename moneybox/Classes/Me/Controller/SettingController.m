//
//  ModifyController.m
//  MolijieIos
//
//  Created by yexifeng on 16/6/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "SettingController.h"


@implementation SettingController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"设置";
    
    [self setupSettingView];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)setupSettingView{
    
    [self addSection:^(JMStaticContentTableViewSection *section, NSUInteger sectionIndex) {
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.textLabel.text = @"帮助中心";
        } whenSelected:^(NSIndexPath *indexPath) {
            
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.textLabel.text = @"关于摇钱帝";
        } whenSelected:^(NSIndexPath *indexPath) {
            
            
        }];
        
        [section addCell:^(JMStaticContentTableViewCell *staticContentCell, UITableViewCell *cell, NSIndexPath *indexPath) {
            staticContentCell.reuseIdentifier = @"ValueTextCell";
            cell.textLabel.text = @"用户使用协议";
        } whenSelected:^(NSIndexPath *indexPath) {
            
            
        }];
    
        
    }];
    
}

@end
