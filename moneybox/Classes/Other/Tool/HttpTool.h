//
//  HttpTool.h
//  SinaWeibo
//
//  Created by yexifeng on 15/11/26.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLJResponse.h"
#import "MJExtension.h"
#import "AFNetworking.h"

@interface HttpTool : NSObject
+(NSDictionary *)aesParams:(NSDictionary*)params;
+(void)GET:(NSString*)url params:(id)params success:(void(^)(id response))success failure:(void(^)(NSError* error))failure;
+(void)POST:(NSString*)url params:(id)params success:(void(^)(id response))success failure:(void(^)(NSError* error))failure;
+(void)POST:(NSString*)url textParams:(id)textParams binaryParams:(id) binaryParams success:(void(^)(id response))success failure:(void(^)(NSError* error))failure;


+(void)MLJGET:(NSString*)url params:(id)params hasAES:(BOOL)aes success:(void(^)(MLJResponse* response))success failure:(void(^)(NSError* error))failure;
+(void)MLJPOST:(NSString*)url params:(id)params hasAES:(BOOL)aes success:(void(^)(MLJResponse* response))success failure:(void(^)(NSError* error))failure;
@end
