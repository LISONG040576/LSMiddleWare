//
//  LSModuleManager.h
//
//
//  Created by 海尔智能-李松 on 2018/11/28.
//  Copyright © 2018 海尔智能-李松. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSModuleProcol.h"



#define ALL_MODULE [[LSModuleManager sharedInstance] allModules]



NS_ASSUME_NONNULL_BEGIN

@interface LSModuleManager : NSObject



/**
 单例

 @return 返回对象
 */
+ (instancetype)sharedInstance;


/**
 注册所有组件Moudle类

 @param plistFile 主工程当中的Moudle配置文件
 */
- (void)loadModulesWithPlistFile:(NSString *)plistFile;


/**
 所有注册过的Module类

 @return 返回Module列表
 */
- (NSArray<id<LSModuleProcol>> *)allModules;

@end

NS_ASSUME_NONNULL_END
