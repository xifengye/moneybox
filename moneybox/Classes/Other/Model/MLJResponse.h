

#import <Foundation/Foundation.h>

@interface MLJResponse : NSObject

@property(nonatomic,copy)NSString* msg;
@property(nonatomic,assign)BOOL hasError;
@property(nonatomic,strong)id data;
@property(nonatomic,assign)int code;

@end
