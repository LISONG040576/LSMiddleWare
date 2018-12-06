//
//  LSModuleProcol.h
//  上移动画
//
//  Created by 海尔智能-李松 on 2018/11/28.
//  Copyright © 2018 海尔智能-李松. All rights reserved.
//


#import <Foundation/Foundation.h>

@import UIKit;

@import UserNotifications;

@protocol LSModuleProcol <UIApplicationDelegate, UNUserNotificationCenterDelegate>


@optional

/**
 向子模块传递配置信息（第三方的ID，key等信息）
 
 @param fileName 文件名称
 */
- (void)sendVendorsConfigInfoToModulesWithFileName:(NSString *)fileName;

/**
 如果有需要，传递数据数据对象

 */
- (void)sendObjectToModules:(id)object;


@end










