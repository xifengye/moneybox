//
//  MBUser.h
//  moneybox
//
//  Created by yexifeng on 16/10/16.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBUser : NSObject
@property(nonatomic,weak)NSString* UpdatedDT;
@property(nonatomic,assign)float S_Money;
@property(nonatomic,weak)NSString* NickName;
@property(nonatomic,weak)NSString* ActiveCode;
@property(nonatomic,assign)float Bank;
@property(nonatomic,assign)int IsDelete;
@property(nonatomic,assign)int UserID;
@property(nonatomic,assign)int S_Num;
@property(nonatomic,weak)NSString* HeadPicUrl;
@property(nonatomic,assign)int AllShakeNum;
@property(nonatomic,assign)int Status;
@property(nonatomic,assign)int CreatedBy;
@property(nonatomic,assign)int AllClear;
@property(nonatomic,weak)NSString* CreatedDT;
@property(nonatomic,assign)int UpdatedBy;
@property(nonatomic,weak)NSString* OpenID;
@property(nonatomic,weak)NSString* S_DT;
@end
