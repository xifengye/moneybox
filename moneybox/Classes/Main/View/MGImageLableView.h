//
//  MGImageLableView.h
//  MolijieIos
//
//  Created by yexifeng on 16/7/21.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGImageLableView : UIImageView
@property(nonatomic,strong)UILabel* labelView;
-(void)setLabeText:(NSString *)text;
@end
