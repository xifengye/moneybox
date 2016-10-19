//
//  MLJResponse.m
//  MolijieIos
//
//  Created by yexifeng on 15/12/4.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import "MLJResponse.h"



@interface MLJResponse()

@end

@implementation MLJResponse

-(BOOL)hasError{
    return _code!=100;
}

@end
