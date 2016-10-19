//
//  NetAddress.h
//  moneybox
//
//  Created by yexifeng on 16/10/17.
//  Copyright © 2016年 yexifeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetAddress : NSObject
@property(nonatomic,assign)int DataID;
@property(nonatomic,assign)int ParentID;
@property(nonatomic,copy)NSString* Name;
@end
