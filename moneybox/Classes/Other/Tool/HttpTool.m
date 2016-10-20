//
//  HttpTool.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/26.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "BinaryData.h"
#import "AppDataMemory.h"
#import "AESCrypt.h"
#import "SecurityUtil.h";
#import "User.h"

//#define AFManager [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://112.124.61.35:9999/int/android_api/"]]
#define AES_PASSWORD @"c028a24f2c6a5c39"

#define AFManager [AFHTTPSessionManager manager]

@implementation HttpTool

+(NSDictionary *)aesParams:(NSDictionary *)params{
    return params;
    NSMutableDictionary* aesParams = [NSMutableDictionary dictionary];
    NSArray* keys = [params allKeys];
    for (int i = 0; i < keys.count; i++)
    {
        NSString* key = [keys objectAtIndex: i];
        id value = [params objectForKey: key];
//        [aesParams setObject:[AESCrypt encrypt:value password:AES_PASSWORD] forKey:key];
        [aesParams setObject:[SecurityUtil encryptAESData:value] forKey:key];
    }
    return aesParams;
}


+(void)GET:(NSString *)url params:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager* manager = AFManager;
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];

}

+(void)POST:(NSString *)url params:(id)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSLog(@"POST  URL:%@  Params:%@",url,params);
    AFHTTPSessionManager* manager = AFManager;
    [manager POST:url parameters:params success:^(NSURLSessionDataTask *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        NSLog(@"error:%@",error);
        if(failure){
            failure(error);
        }
    }];

}

+(void)POST:(NSString *)url textParams:(id)textParams binaryParams:(id)binaryParams success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    AFHTTPSessionManager* manager = AFManager;
    [manager POST:url parameters:textParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //constructingBodyWithBlock这个block在发送请求之前会自动调用
        for(BinaryData* data in binaryParams){
            [formData appendPartWithFileData:data.data name:data.paramName fileName:data.serverFileName mimeType:data.mimeType];
        }
    } success:^(NSURLSessionDataTask *operation, id responseObject) {
        if(success){
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        if(failure){
            failure(error);
        }
    }];

}

+(void)MLJGET:(NSString *)url params:(id)params hasAES:(BOOL)aes success:(void (^)(MLJResponse *))success failure:(void (^)(NSError *))failure{
    if(aes){
        params = [HttpTool aesParams:params];
    }
    [HttpTool GET:url params:params success:^(id response) {
//        NSError *error;
//        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:response
//                                                             options:NSJSONReadingMutableContainers
//                                                               error:&error];
        MLJResponse* r = [MLJResponse objectWithKeyValues:response];
        success(r);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+(void)GET:(NSString *)url params:(id)params hasAES:(BOOL)aes success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    if(aes){
        params = [HttpTool aesParams:params];
    }
    [HttpTool GET:url params:params success:^(id response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+(void)MLJPOST:(NSString *)url params:(id)params hasAES:(BOOL)aes success:(void (^)(MLJResponse *))success failure:(void (^)(NSError *))failure{
    if(aes){
        params = [HttpTool aesParams:params];
    }
    [HttpTool POST:url params:params success:^(id response) {
        MLJResponse* r = [MLJResponse objectWithKeyValues:response];
        if(success){
            success(r);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}


@end
