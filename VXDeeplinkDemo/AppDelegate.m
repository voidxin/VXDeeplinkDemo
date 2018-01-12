//
//  AppDelegate.m
//  VXDeeplinkDemo
//
//  Created by voidxin on 2018/1/5.
//  Copyright © 2018年 voidxin. All rights reserved.
//

#import "AppDelegate.h"
#import "VXRouter.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self loadControllersFromPlistFile:@"VXURLRouter.plist"];
    
    
    return YES;
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSString *scheme = url.scheme;
    NSString *host = url.host;
    NSString *query = url.query;
    if ([url.scheme isEqualToString:@"vxdeeplink"]) {
        //deeplink跳转协议 :com.deeplink://deeplink.htm?id=123456 com.deeplink 代表就是设置的 Url Schemes =>example:VXDeeplink://app.wgmf.com?target=xxxx
        //取出target跳转
        if (query.length) {
            NSString *targetVC = [query componentsSeparatedByString:@"="].lastObject;
            NSString *pushURL = [NSString stringWithFormat:@"/%@/%@",targetVC,@"shopping page"];
            [[VXRouter shared] pushURLString:pushURL animated:YES];
            return YES;
        }
        return false;
        
    } 
    
    return false;
}

#pragma mark - 生成路由
- (void)loadControllersFromPlistFile:(NSString *)plistName {
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSDictionary *configDict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    if (!configDict) {
        NSAssert(0, @"请按照说明添加对应的plist文件");
        
    }
    //遍历字典
    NSArray *arr = [configDict allKeys];
    for (NSInteger i = 0; i < arr.count; i++) {
        NSString *urls = arr[i];
        UIViewController *VC = nil;
        NSString *controller = [configDict objectForKey:arr[i]];
        //swift创建的controller要特殊处理
        Class class = NSClassFromString(controller);
        VC = [[class alloc] init];
        
        
        [[VXRouter shared] map:urls toControllerClass:[VC class]];
        
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
