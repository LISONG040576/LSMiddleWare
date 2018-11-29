//
//  LSModuleManager.m
//  上移动画
//
//  Created by 海尔智能-李松 on 2018/11/28.
//  Copyright © 2018 海尔智能-李松. All rights reserved.
//

#import "LSModuleManager.h"


@interface LSModuleManager ()

@property (nonatomic, strong) NSMutableArray<id<LSModuleProcol>> *modules;

@end


@implementation LSModuleManager

+ (instancetype)sharedInstance {

    static dispatch_once_t predicate;
    static id UPModuleManagerInstance = nil;
    dispatch_once(&predicate, ^{
        UPModuleManagerInstance = [[self alloc] init];
    });
    return UPModuleManagerInstance;

}

- (NSMutableArray<id<LSModuleProcol>> *)modules {
    
    if (!_modules) {
        _modules = [NSMutableArray array];
    }
    return _modules;

}

- (void)addModule:(id<LSModuleProcol>) module {
    
    if (module == nil) {
        NSLog(@"--- 该模块类为空，不能注册");
        return;
    }
    
    if (![module conformsToProtocol:@protocol(LSModuleProcol)]) {
        NSLog(@"--- 该模块类没有签订应有的协议，不能注册");
        return;
    }
    
    if([self.modules containsObject:module]){
        NSLog(@"--- 该模块类已经注册，不要重复注册");
        return;
    }
    
    [self.modules addObject:module];

}

- (void)loadModulesWithPlistFile:(NSString *)plistFile {
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistFile ofType:@".plist"];
    NSArray *moduleNames = [NSArray arrayWithContentsOfFile:plistPath];
    
    for (NSString *moduleName in moduleNames) {
        Class moduleClass = NSClassFromString(moduleName);
        if (moduleClass != nil) {
            id module = [moduleClass new];
            [self addModule:module];
        }else{
            NSLog(@"----- %@ ----- 没有这个类 -----",moduleName);
        }
    }
}

- (NSArray<id<LSModuleProcol>> *)allModules {
    

    return self.modules;

}



@end
