//
//  MGAccount.h
//  SinaWeibo
//
//  Created by yexifeng on 15/11/16.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 var CodeType:String = "";
 var Expire:Int64 = 0;
 var Value:String = "";
 var ExpireDate:NSDate?;
*/

@interface RefreshToken : NSObject<NSCoding>
@property(nonatomic,copy)NSString* openid;
@property(nonatomic,assign)long expires_in;//秒
@property(nonatomic,copy)NSString* scope;
@property(nonatomic,copy)NSString* refresh_token;
@property(nonatomic,copy)NSString* access_token;

@property(nonatomic,strong)NSDate* accessTokenExpireDate;
@property(nonatomic,strong)NSDate* refreshTokenExpireDate;

-(instancetype) initWithDictionary:(NSDictionary*)dictionary;
+(instancetype) accountWithDictionary:(NSDictionary*)dictionary;
@end
