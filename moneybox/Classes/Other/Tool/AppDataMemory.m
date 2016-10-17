//
//  AppDataMemory.m
//  MolijieIos
//
//  Created by yexifeng on 15/12/4.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "AppDataMemory.h"

@implementation AppDataMemory
static AppDataMemory*shareInstance = nil;
+(instancetype)instance{
    if(shareInstance==nil){
        shareInstance = [[self alloc]init];
        shareInstance.wxUser = [[User alloc]init];
    }
    return shareInstance;
}


-(void)getMbUser:(MBUserResultBlock)resultBlock{
    if(_mbUser==nil){
        [AppDataTool requestMBUserInfo:resultBlock onError:^(int code, NSString *msg) {
            NSLog(@"requestMBUserInfo:%d-%@",code,msg);
        }];
    }else{
        resultBlock(_mbUser);
    }
}

@end
