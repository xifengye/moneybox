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
#import "WalletRecord.h"

@implementation AppDataTool


+(void)requestWxToken:(NSString*)code onResponse:(LoginTokenResultBlock)response onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code", WX_APP_ID,WX_APP_SECRET,code];
    [HttpTool GET:url params:nil hasAES:true success:^(id result) {
        NSError *error;
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:result
                                                             options:NSJSONReadingMutableContainers
                                                               error:&error];
        response([LoginToken objectWithKeyValues:dict]);
    } failure:^(NSError *error) {
        NSLog(@"failure:%@",error);
    }];

}

+(void)refreshWxToken:(NSString*)refreshToken onResponse:(TokenResultBlock)response onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%@&grant_type=refresh_token&refresh_token=%@",WX_APP_ID,refreshToken];
//    [HttpTool GET:url params:nil hasAES:true success:^(id result) {
//        response([RefreshToken objectWithKeyValues:result]);
//    } failure:^(NSError *error) {
//        NSLog(@"failure:%@",error);
//    }];
    NSData* result = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError *err;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers
                                                           error:&err];
    response([RefreshToken objectWithKeyValues:dict]);

}


+(void)requestWXUserInfo:(NSString*)token openId:(NSString*)openId onResponse:(UserResultBlock)response onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@", token,openId];
//    [HttpTool GET:url params:nil hasAES:true success:^(id result) {
//        NSError *error;
//        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:result
//                                                             options:NSJSONReadingMutableContainers
//                                                               error:&error];
//        response([User objectWithKeyValues:dict]);
//    } failure:^(NSError *error) {
//        NSLog(@"failure:%@",error);
//    }];
    NSData* result = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    NSError *err;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableContainers
                                                                   error:&err];
    response([User objectWithKeyValues:dict]);
}

+(void)requestMBUserInfo:(MBUserResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"http://yq.weifirst.com/api/AppUser/Get?unionid=%@",@"oto1av6lZ3d2YNLtmZb961WuIChc"];
    [HttpTool MLJGET:url params:nil hasAES:false success:^(MLJResponse *response) {
        if(!response.hasError){
            MBUser* mbUser = [MBUser objectWithKeyValues:response.data];
            onResponse(mbUser);
        }else{
            error(response.code,response.msg);
        }

        
    } failure:^(NSError *error) {
        NSLog(@"requestMBUserInfo failure:%@",error);
    }];
}


+(void)requestDeviceList:(ArrayResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = @"http://yq.weifirst.com/api/AppIbeacon/GetMyDevice";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:@"oto1av6lZ3d2YNLtmZb961WuIChc" forKey:@"unionid"];
    [HttpTool MLJPOST:url params:nil hasAES:false success:^(MLJResponse *response) {
        
        if(!response.hasError){
            onResponse([Device objectArrayWithKeyValuesArray:response.data]);
        }else{
            error(response.code,response.msg);
        }

    } failure:^(NSError *error) {
        NSLog(@"requestDeviceList failure:%@",error);
    }];

}

+(void)requestNetAddress:(int)parentId response:(ArrayResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = [NSString stringWithFormat:@"http://yq.weifirst.com/api/CommonData/GetData2?datatype=NewAddress&fatherid=%d",parentId];
    [HttpTool GET:url params:nil hasAES:false success:^(id response) {
        onResponse(response);
    } failure:^(NSError *error) {
        NSLog(@"requestNetAddress failure:%@",error);
    }];

}


+(void)activeDevice:(NSString *)inviteCode flag:(NSString *)flag area:(int)area response:(StringResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = @"http://yq.weifirst.com/api/AppBind/ScanAddDevice";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:@"oto1av6lZ3d2YNLtmZb961WuIChc" forKey:@"unionid"];
    [params setObject:inviteCode forKey:@"inviteCode"];
    [params setObject:flag forKey:@"flag"];
    [params setObject:[NSNumber numberWithInteger:area] forKeyedSubscript:@"area"];
    [HttpTool MLJPOST:url params:params hasAES:false success:^(MLJResponse *response) {
        if(response.hasError){
            error(response.code,response.msg);
        }else{
            onResponse(response.data);
        }
    } failure:^(NSError *error) {
        NSLog(@"activeDevice failure:%@",error);
    }];

}

+(void)requestBankLog:(int)pageIndex response:(ArrayResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url =@"http://yq.weifirst.com/api/AppUser/SearchBankLog";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setObject:@"oto1av6lZ3d2YNLtmZb961WuIChc" forKey:@"unionid"];
    [params setObject:[NSNumber numberWithInteger:pageIndex] forKey:@"pageIndex"];
    [params setObject:@"20" forKey:@"pageSize"];
    [HttpTool MLJPOST:url params:params hasAES:false success:^(MLJResponse *response) {
        if(!response.hasError){
            onResponse([WalletRecord objectArrayWithKeyValuesArray:response.data]);
        }else{
            error(response.code,response.msg);
        }
        
    } failure:^(NSError *error) {
        NSLog(@"requestDeviceList failure:%@",error);
    }];

}

+(void)applyingAgency:(NSDictionary *)params response:(BoolResultBlock)onResponse onError:(ErrorBlock)error{
    NSString* url = @"http://yq.weifirst.com/api/AppAgent/ApplyAgent";
    [HttpTool MLJPOST:url params:params hasAES:false success:^(MLJResponse *response) {
        if(!response.hasError){
            onResponse(true);
        }else{
            error(response.code,response.msg);
        }
        
    } failure:^(NSError *error) {
        NSLog(@"applyingAgency failure:%@",error);
    }];

}

@end
