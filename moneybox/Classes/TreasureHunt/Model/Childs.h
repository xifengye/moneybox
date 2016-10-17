//
//  Childs.h
//  MolijieIos
//
//  Created by yexifeng on 15/12/17.
//  Copyright © 2015年 moregood. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CataDetail.h"

@interface Childs : NSObject{
    CataDetail* cataDetail;
}
@property(nonatomic,strong)NSArray* Childs;
@property(nonatomic,strong)NSArray<NSString*>* SKUS;
@property(nonatomic,copy)NSString* ParentID;
@property(nonatomic,copy)NSString* ShardingKey;
@property(nonatomic,copy)NSString* ObjectID;
@property(nonatomic,copy)NSString* Title;

-(CataDetail*)getCataDetail;
-(void)setCataDetail:(CataDetail*)cd;

@end
