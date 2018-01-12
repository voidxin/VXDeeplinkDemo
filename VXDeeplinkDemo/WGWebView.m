//
//  WGSpecialWebView.m
//  YingXiaoGuanJia
//
//  Created by voidxin on 17/1/9.
//  Copyright © 2017年 wugumofang. All rights reserved.
//

#import "WGWebView.h"
#import <WebKit/WebKit.h>
#import "VXRouter.h"
@interface WGWebView ()<UIWebViewDelegate>{
    //1:页面消失的时候要旋转回竖屏，2:页面消失时不用旋转回竖屏
    NSInteger _screenState;
}
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation WGWebView
- (void)viewDidLoad {
    [super viewDidLoad];
    //去除webView滚动时的阴影效果
    [self webViewBackgroundSetter];

    [self.webView setBackgroundColor:[UIColor whiteColor]];
    self.webView.delegate=self;
    [self.view addSubview:self.webView];
    self.webView.frame = self.view.bounds;
    //
    self.url = @"https://oan5zurgx.qnssl.com/deeplink.html";
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.url]]]];
    
  
}



- (UIWebView *)webView{
    if (!_webView) {
        _webView=[[UIWebView alloc]init];
        _webView.delegate=self;
    }
    return _webView;
}

-(void)setParams:(NSDictionary *)params{
    [super setParams:params];
    NSString *urlStr=[params[@"urls"] stringByReplacingOccurrencesOfString:@"*" withString:@"/"];
    urlStr=[urlStr stringByReplacingOccurrencesOfString:@"#" withString:@"?"];
    self.url=urlStr;
    self.title = [params objectForKey:@"title"];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}


#




#pragma mark 去除webView滚动时的阴影效果
-(void)webViewBackgroundSetter{
    for (UIScrollView* view in self.webView.subviews)
    {
        if ([view isKindOfClass:[UIScrollView class]])
        {
            view.bounces = NO;
        }
    }
    self.webView.backgroundColor = [UIColor clearColor];
    [self.webView setOpaque:NO];
}

#pragma mark - webViewDelegate
- (void) webViewDidStartLoad:(UIWebView *)webView
{
   
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
  
    
    //隐藏wenbView的导航栏
    [self.webView stringByEvaluatingJavaScriptFromString:@"$('.backDiv').hide()"];
    [self.webView stringByEvaluatingJavaScriptFromString:@"$('.topTitle').hide()"];
//    
//    // 获取webView的title
//    self.title=[self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString * htmlPath = @"https://oan5zurgx.qnssl.com/index.html";
    NSString * htmlCont = [NSString stringWithContentsOfURL:[NSURL URLWithString:htmlPath]
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [self.webView loadHTMLString:htmlCont baseURL:baseURL];
}




@end

