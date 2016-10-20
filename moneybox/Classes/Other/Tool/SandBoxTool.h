//
//  SendBoxTool.h
//  MolijieIos
//
//  Created by yexifeng on 15/12/3.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface SandBoxTool : NSObject

+(LoginToken*)wxLoginToken;
+(void)saveWxLoginToken:(LoginToken*)token;

+(void)saveWXRefreshToken:(LoginToken*)loginToken refreshToken:(RefreshToken*)refreshToken;

+(void)saveUser:(User*)user;
+(User*)user;
+(void)setRememberPassword:(BOOL)value;
+(BOOL)isRememberPassword;
+(void)setRegister:(BOOL)value;
+(BOOL)isRegister;
@end
