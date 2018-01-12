//
//  WGMallViewController.m
//  VXDeeplinkDemo
//
//  Created by voidxin on 2018/1/5.
//  Copyright © 2018年 voidxin. All rights reserved.
//

#import "WGMallViewController.h"

@interface WGMallViewController ()

@end

@implementation WGMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"shopping page";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"this is shopping page";
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, 200, 30);
    label.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    [self.view addSubview:label];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"跳转到营销管家人才库页面" forState:0];
    btn.frame = CGRectMake(0, 0, 200, 30);
    btn.center = CGPointMake(self.view.frame.size.width * 0.5 , self.view.frame.size.height * 0.5 + 45);
    
    [btn addTarget:self action:@selector(pushTargetBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)pushTargetBtn {
    NSString *urlString = @"YingXiaoGuanJia://app.wgmf.com?target=kucun";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        //若安装了需要跳转的app->跳转到APP
        NSURL * url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:url];
    }else{
        //如果没安装则跳转到安装页面
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-services://?action=download-manifest&url=https://oan5zurgx.qnssl.com/yxgj.plist"]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
