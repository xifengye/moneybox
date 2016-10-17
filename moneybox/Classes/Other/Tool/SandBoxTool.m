//
//  SendBoxTool.m
//  MolijieIos
//
//  Created by yexifeng on 15/12/3.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "SandBoxTool.h"
#import "AppDataMemory.h"

#define appTokenFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"appToken.data"]

#define userTokenFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userToken.data"]

#define userFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.data"]

#define key_rememberPassword    @"rememberPassword"
#define key_isRegister   @"isRegister"

@implementation SandBoxTool

+(void)saveAppToken:(Token *)token{
    if(token!=nil){
        [AppDataMemory instance].appToken = token;
        NSDate* now = [NSDate date];
        token.expireDate = [now dateByAddingTimeInterval:token.Expire];
        [NSKeyedArchiver archiveRootObject:token toFile:appTokenFile];
    }
}

+(Token *)appToken{
    NSDate* now = [NSDate date];
    Token* token = [NSKeyedUnarchiver unarchiveObjectWithFile:appTokenFile];
    if([now compare:token.expireDate] == NSOrderedAscending){
        [AppDataMemory instance].appToken = token;
        return token;
    }else{
        return nil;
    }
}

+(void)saveUserToken:(Token *)token{
    if(token!=nil){
        [AppDataMemory instance].wxUser.userToken = token;
        NSDate* now = [NSDate date];
        token.expireDate = [now dateByAddingTimeInterval:token.Expire];
        [NSKeyedArchiver archiveRootObject:token toFile:userTokenFile];
    }
}

+(Token *)userToken{
    NSDate* now = [NSDate date];
    Token* token = [NSKeyedUnarchiver unarchiveObjectWithFile:userTokenFile];
    if([now compare:token.expireDate] == NSOrderedAscending){
        User* user = [SandBoxTool user];
        [[AppDataMemory instance].wxUser update:user];
        [AppDataMemory instance].wxUser.userToken = token;
        return token;
    }else{
        return nil;
    }
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
