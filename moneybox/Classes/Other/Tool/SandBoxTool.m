//
//  SendBoxTool.m
//  MolijieIos
//
//  Created by yexifeng on 15/12/3.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "SandBoxTool.h"
#import "AppDataMemory.h"

#define wxTokenFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"appToken.data"]


#define userFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.data"]

#define key_rememberPassword    @"rememberPassword"
#define key_isRegister   @"isRegister"

@implementation SandBoxTool

+(void)saveWxLoginToken:(LoginToken *)token{
    if(token!=nil){
        [AppDataMemory instance].wxLoginToken = token;
        NSDate* now = [NSDate date];
        token.accessTokenExpireDate = [now dateByAddingTimeInterval:token.expires_in];
        token.refreshTokenExpireDate = [now dateByAddingTimeInterval:60*60*24*30-60];
        [NSKeyedArchiver archiveRootObject:token toFile:wxTokenFile];
    }
}

+(void)saveWXRefreshToken:(LoginToken *)loginToken refreshToken:(RefreshToken *)refreshToken{
    NSDate* now = [NSDate date];
    loginToken.access_token = refreshToken.access_token;
    loginToken.refresh_token = refreshToken.refresh_token;
    loginToken.accessTokenExpireDate = [now dateByAddingTimeInterval:refreshToken.expires_in];
    [NSKeyedArchiver archiveRootObject:loginToken toFile:wxTokenFile];
}

+(LoginToken *)wxLoginToken{
    LoginToken* token = [NSKeyedUnarchiver unarchiveObjectWithFile:wxTokenFile];
    return token;
}


+(void)saveUser:(User *)user{
    if(user!=nil){
        [NSKeyedArchiver archiveRootObject:user toFile:userFile];
    }
}


+(User *)user{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:userFile];
}

+(void)setRememberPassword:(BOOL)value{
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key_rememberPassword];
}

+(BOOL)isRememberPassword{
    return [[NSUserDefaults standardUserDefaults]boolForKey:key_rememberPassword];
}

+(void)setRegister:(BOOL)value{
    [[NSUserDefaults standardUserDefaults]setBool:value forKey:key_isRegister];
}

+(BOOL)isRegister{
    return  [[NSUserDefaults standardUserDefaults]boolForKey:key_isRegister];
}


@end
