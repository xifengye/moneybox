//
//  MGDiscoverViewController.m
//  SinaWeibo
//
//  Created by yexifeng on 15/11/5.
//  Copyright (c) 2015年 moregood. All rights reserved.
//

#import "YouLeMeiController.h"
#import "MGSearchBar.h"
#import "MLJConfig.h"
#import "MBProgressHUD+MJ.h"

@interface YouLeMeiController ()<UIWebViewDelegate>

@end

@implementation YouLeMeiController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView* webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:webView];
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:article_url]]];

}


- (void)webViewDidStartLoad:(UIWebView *)webView{
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
}



@end
