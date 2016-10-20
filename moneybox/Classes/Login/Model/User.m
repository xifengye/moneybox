//
//  User.m
//  MolijieIos
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "User.h"

@implementation User
-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.sex = [aDecoder decodeIntegerForKey:@"sex"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.unionid = [aDecoder decodeObjectForKey:@"unionid"];
        self.privilege = [aDecoder decodeObjectForKey:@"privilege"];
        self.province = [aDecoder decodeObjectForKey:@"province"];
        self.openid = [aDecoder decodeObjectForKey:@"openid"];
        self.language = [aDecoder decodeObjectForKey:@"language"];
        self.headimgurl = [aDecoder decodeObjectForKey:@"headimgurl"];
        self.country = [aDecoder decodeObjectForKey:@"country"];
        self.city = [aDecoder decodeObjectForKey:@"city"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.unionid forKey:@"unionid"];
    [aCoder encodeObject:self.privilege forKey:@"privilege"];
    [aCoder encodeObject:self.province forKey:@"province"];
    [aCoder encodeObject:self.openid forKey:@"openid"];
    [aCoder encodeObject:self.language forKey:@"language"];
    [aCoder encodeObject:self.headimgurl forKey:@"headimgurl"];
    [aCoder encodeObject:self.country forKey:@"country"];
    [aCoder encodeBool:self.city forKey:@"city"];
}

-(void)update:(User *)other{
    if(other){
        self.nickname = other.nickname;
        self.unionid = other.unionid;
        self.privilege = other.privilege;
        self.province = other.province;
        self.openid = other.openid;
        self.language = other.language;
        self.headimgurl = other.headimgurl;
        self.country = other.country;
        self.city = other.city;
    }
}

@end
