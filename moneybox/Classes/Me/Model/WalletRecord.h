//
//  WalletRecord.h
//  moneybox
//
//  Created by yexifeng on 16/10/17.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalletRecord : NSObject
@property(nonatomic,assign)int FK_IbeaconID;
@property(nonatomic,assign)int FK_Profit4UserShakeID;
@property(nonatomic,assign)int FK_UserID;
@property(nonatomic,assign)float Money;
@property(nonatomic,assign)int Type;
@property(nonatomic,copy)NSString* CreatedDT;
@property(nonatomic,assign)int FK_ShakeID;
@property(nonatomic,assign)int UserBankLogID;
@property(nonatomic,assign)int FK_UserClearID;
@property(nonatomic,copy)NSString* Remark;
@property(nonatomic,assign)float Balance;
@end
