//
//  MGAccount.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/16.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "RefreshToken.h"

@implementation RefreshToken

+(RefreshToken *)accountWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc]initWithDictionary:dictionary];
}

-(RefreshToken *)initWithDictionary:(NSDictionary *)dictionary{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        _openid = [aDecoder decodeObjectForKey:@"openid"];
        _expires_in = [aDecoder decodeInt64ForKey:@"expires_in"];
        _scope = [aDecoder decodeObjectForKey:@"scope"];
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _refresh_token = [aDecoder decodeObjectForKey:@"refresh_token"];
        _accessTokenExpireDate = [aDecoder decodeObjectForKey:@"accessTokenExpireDate"];
        _refreshTokenExpireDate = [aDecoder decodeObjectForKey:@"refreshTokenExpireDate"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.openid forKey:@"openid"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.scope forKey:@"scope"];
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.refresh_token forKey:@"refresh_token"];
    [aCoder encodeObject:self.accessTokenExpireDate forKey:@"accessTokenExpireDate"];
    [aCoder encodeObject:self.refreshTokenExpireDate forKey:@"refreshTokenExpireDate"];
}

@end
