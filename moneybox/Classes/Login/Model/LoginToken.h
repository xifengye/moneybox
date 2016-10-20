//
//  LoginToken.h
//  moneybox
//
//  Created by yexifeng on 16/10/19.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import "RefreshToken.h"

@interface LoginToken : RefreshToken
@property(nonatomic,copy)NSString* unionid;
@end
