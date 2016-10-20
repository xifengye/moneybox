//
//  User.h
//  MolijieIos
//
//  Created by yexifeng on 16/5/27.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginToken.h"

@interface User : NSObject


@property(nonatomic,copy)NSString* nickname;
@property(nonatomic,copy)NSString* unionid;
@property(nonatomic,copy)NSString* privilege;
@property(nonatomic,copy)NSString* province;
@property(nonatomic,copy)NSString* openid;
@property(nonatomic,copy)NSString* language;
@property(nonatomic,copy)NSString* headimgurl;
@property(nonatomic,copy)NSString* country;
@property(nonatomic,copy)NSString* city;
@property(nonatomic,assign)int sex;

-(void)update:(User*)other;

@end
