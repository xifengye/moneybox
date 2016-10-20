//
//  AppDataTool.h
//  MolijieIos
//
//  Created by yexifeng on 15/12/3.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RefreshToken.h"
#import "MLJResponse.h"
#import "User.h"
#import "MBUser.h"

typedef void(^ErrorBlock)(int,NSString*);
typedef void(^TokenResultBlock)(RefreshToken*);
typedef void(^LoginTokenResultBlock)(LoginToken*);
typedef void(^FloatResultBlock)(float);
typedef void(^EmptyResultBlock)();
typedef void(^ArrayResultBlock)(NSArray*);
typedef void(^BoolResultBlock)(BOOL);
typedef void(^UserResultBlock)(User*);
typedef void(^StringResultBlock)(NSString*);
typedef void(^MBUserResultBlock)(MBUser*);



@interface AppDataTool : NSObject
+(void)requestWxToken:(NSString*)code onResponse:(LoginTokenResultBlock)response onError:(ErrorBlock)error;
+(void)refreshWxToken:(NSString*)refreshToken onResponse:(TokenResultBlock) response onError:(ErrorBlock)error;

+(void)requestWXUserInfo:(NSString*)token openId:(NSString*)openId onResponse:(UserResultBlock)response onError:(ErrorBlock)error;
+(void)requestMBUserInfo:(MBUserResultBlock)onResponse onError:(ErrorBlock)error;
+(void)requestDeviceList:(ArrayResultBlock)onResponse onError:(ErrorBlock)error;
+(void)requestNetAddress:(int)parentId response:(ArrayResultBlock)onResponse onError:(ErrorBlock)error;

+(void)activeDevice:(NSString*)inviteCode flag:(NSString*)flag area:(int)area response:(StringResultBlock)onResponse onError:(ErrorBlock)error;

+(void)requestBankLog:(int)pageIndex response:(ArrayResultBlock)onResponse onError:(ErrorBlock)error;


+(void)applyingAgency:(NSDictionary*)param response:(BoolResultBlock)onResponse onError:(ErrorBlock)error;

@end
