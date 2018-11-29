//
//  AppDelegate.m
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSMiddleWareAppDelegate.h"
#import "LSMiddleWareViewController.h"

@interface LSMiddleWareAppDelegate ()

@end

@implementation LSMiddleWareAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建window
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 创建根视图C
    LSMiddleWareViewController *rootVC = [[LSMiddleWareViewController alloc] init];
    // 设置根视图控制器
    _window.rootViewController = rootVC;
    _window.backgroundColor = [UIColor whiteColor];
    // 显示
    [_window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
