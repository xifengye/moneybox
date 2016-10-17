//
//  ActiveAccount.h
//  MolijieIos
//
//  Created by yexifeng on 16/8/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActiveAccount : NSObject
@property(nonatomic,copy)NSString* Mobile;
@property(nonatomic,copy)NSString* NickName;
@property(nonatomic,copy)NSString* UserName;
@property(nonatomic,copy)NSString* Password;
@property(nonatomic,assign)BOOL Activated;

@end
