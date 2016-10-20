//
//  SinaLoginController.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/13.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "LoginController.h"
#import "AppDataTool.h"
#import "SandBoxTool.h"
#import "MainController.h"
#import "MBProgressHUD+MJ.h"
#import "User.h"
#import "AppDataMemory.h"
#import "MLJConfig.h"
#import "UIImage+MG.h"
#import "UIButton+MG.h"
#import "AppDelegate.h"


#define NumberOfPager   4


@implementation LoginController

-(void)toMainController{
    MainController* mainController = [[MainController alloc]init];
    [self dismissViewControllerAnimated:true completion:nil];
    [self presentViewController:mainController animated:true completion:nil];}

-(void)toLoginView{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didWxLoginSuccess:) name:@"WX_RESULT" object:nil];
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = true;
    scrollView.showsHorizontalScrollIndicator = false;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    CGSize scrollViewSize = scrollView.frame.size;
    scrollView.contentSize = CGSizeMake(scrollViewSize.width*NumberOfPager, scrollViewSize.height);
    for(int i=0;i<NumberOfPager;i++){
        UIImageView* imageView = [[UIImageView alloc] init];
        NSString* imageName = [NSString stringWithFormat:@"launch%d",i+1];
        UIImage* image = [UIImage imageNamed:imageName];
        imageView.image = image;
        imageView.frame = CGRectMake(scrollViewSize.width*i, 0, scrollViewSize.width, scrollViewSize.height);
        [scrollView addSubview:imageView];
        
        if(i==NumberOfPager-1){
            UIButton* btn =[UIButton buttonWithRoundedRectStyle:@"微信登录" cornerRadius:20];
            float btnWidth =self.view.frame.size.width*0.5f;
            btn.frame = CGRectMake(0, 0, btnWidth, 40);
            btn.center = CGPointMake(scrollViewSize.width/2, scrollViewSize.height*0.9);
            [imageView addSubview:btn];
            imageView.userInteractionEnabled = YES;
            [btn addTarget:self action:@selector(didLoginWeiChat:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    UIPageControl* pageControl = [[UIPageControl alloc] init];
    pageControl.frame = CGRectMake(0, scrollViewSize.height-20,scrollViewSize.width, 20);
    
    pageControl.numberOfPages = NumberOfPager;
    //    pageControl.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    LoginToken* token = [SandBoxTool wxLoginToken];
    NSDate* now = [NSDate date];
    if(token && [now compare:token.refreshTokenExpireDate] == NSOrderedAscending){
        [AppDataTool refreshWxToken:token.refresh_token onResponse:^(RefreshToken * refreshToken) {
            [SandBoxTool saveWXRefreshToken:token refreshToken:refreshToken];
            [self toMainController];
        } onError:^(int errorCode, NSString *msg) {
            [self toLoginView];
        }];
    }else{
        [self toLoginView];
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = fabs(scrollView.contentOffset.x) / scrollView.frame.size.width;
    
}

-(void)didLoginWeiChat:(UIButton*)button{
    [self sendAuthRequest];
}


- (void)dealloc{
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)sendAuthRequest
{
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init] ;
    req.scope = @"snsapi_userinfo" ;
    req.state = @"App" ;
    req.openID = WX_APP_ID;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendAuthReq:req viewController:self delegate:(AppDelegate*)[UIApplication sharedApplication].delegate];

}


-(void)didWxLoginSuccess:(NSNotification*)notification{
    SendAuthResp* resp = notification.object;
    if(resp.errCode==0){
        [AppDataTool requestWxToken:resp.code onResponse:^(LoginToken * token) {
            [SandBoxTool saveWxLoginToken:token];
            [self toMainController];
        } onError:^(int errorCode, NSString *msg) {
            
        }];
    }
    NSLog(@"wxloginSuccess:%@",resp.code);
}

@end
