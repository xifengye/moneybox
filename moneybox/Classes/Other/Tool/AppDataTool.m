//
//  AppDataTool.m
//  MolijieIos
//
//  Created by yexifeng on 15/12/3.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "AppDataTool.h"
#import "HttpTool.h"
#import "SandBoxTool.h"
#import "AppDataMemory.h"
#import "MLJConfig.h"
#import "Device.h"

@implementation AppDataTool
+(void)requestAppToken:(TokenResultBlock)onResponse onError:(ErrorBlock)error{
    
//    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"MoLiJieClientForAndroid",@"appid",@"18259181651",@"password",@"xx-xxx-xxxx",@"device_code", nil];
    
    NSString* pushToken = [[NSUserDefaults standardUserDefaults] objectForKey:PUSH_TOKEN_KEY];
    if(!pushToken){
        pushToken = @"";
    }
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"MoLiJieClientForIOS",@"appid",@"15005919722",@"password",pushToken,@"device_code", nil];
    [HttpTool MLJPOST:@"http://112.124.61.35:9999/int/ios_api/AppAuthorize" params:dic hasAES:true success:^(MLJResponse *response) {
        if(response.hasError){
            NSLog(@"Error:%d",response.code);
            error(response.code,response.msg);
        }else{
            Token* token = [Token objectWithKeyValues:response.data];
            [SandBoxTool saveAppToken:token];
            onResponse(token);
        }

    } failure:^(NSError *error) {
        NSLog(@"failure:%@",error);
    }];
}


+(void)requestUserInfo:(UserResultBlock)onResponse onError:(ErrorBlock)error{
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [HttpTool MLJPOST:@"http://112.124.61.35:9999/int/ios_api/LoadCurrentUserInfo" params:params hasAES:true success:^(MLJResponse *response) {
        if(response.hasError){
            NSLog(@"requestUserInfo Error:%lld",response.code);
            error(response.code,response.msg);
        }else{
            NSLog(@"requestUserInfo resp:%@",response.data);
            onResponse([User objectWithKeyValues:response.data]);
        }
        
    } failure:^(NSError *error) {
        NSLog(@"requestUserInfo failure:%@",error);
    }];

}

+(void)requestMBUserInfo:(MBUserResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"http://yq.weifirst.com/api/AppUser/Get?unionid=%@",@"oto1av6lZ3d2YNLtmZb961WuIChc"];
    [HttpTool MLJGET:url params:nil hasAES:false success:^(MLJResponse *response) {
        MBUser* mbUser = [MBUser objectWithKeyValues:response.data];
        onResponse(mbUser);
    } failure:^(NSError *error) {
        NSLog(@"requestMBUserInfo failure:%@",error);
    }];
}


+(void)requestDeviceList:(ArrayResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = @"http://yq.weifirst.com/api/AppIbeacon/GetMyDevice";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:@"oto1av6lZ3d2YNLtmZb961WuIChc" forKey:@"unionid"];
    [HttpTool MLJPOST:url params:nil hasAES:false success:^(MLJResponse *response) {
        onResponse([Device objectArrayWithKeyValuesArray:response.data]);
    } failure:^(NSError *error) {
        NSLog(@"requestDeviceList failure:%@",error);
    }];

}


@end
