//
//  VoidXURLNavigation.h
//  YingXiaoGuanJia
//
//  Created by voidxin on 16/9/2.
//  Copyright © 2016年 wugumofang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface VXURLNavigation : NSObject


/**
 *  返回当前控制器
 */
- (UIViewController *)currentViewController;

/**
 *  返回当前的导航控制器
 */
- (UINavigationController *)currentNavigationViewController;



+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace;
+ (void)presentViewController:(UIViewController *)viewController animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

+ (void)popTwiceViewControllerAnimated:(BOOL)animated;
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;
+ (void)popToRootViewControllerAnimated:(BOOL)animated;


+ (void)dismissTwiceViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
+ (void)dismissToRootViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
+ (instancetype)sharedVXURLNavigation;
NS_ASSUME_NONNULL_END

@end
