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

+ (instancetype)sharedInstance;

- (void)loadModulesWithPlistFile:(NSString *)plistFile;

- (NSArray<id<LSModuleProcol>> *)allModules;

@end

NS_ASSUME_NONNULL_END
