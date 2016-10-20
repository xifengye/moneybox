//
//  AppDataMemory.h
//  MolijieIos
//
//  Created by yexifeng on 15/12/4.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "MBUser.h"
#import "AppDataTool.h"


@interface AppDataMemory : NSObject
@property(nonatomic,strong)User* wxUser;
@property(nonatomic,strong)LoginToken* wxLoginToken;
@property(nonatomic,strong)MBUser* mbUser;

+(instancetype)instance;

-(void)getMbUser:(MBUserResultBlock)resultBlock;
@end
