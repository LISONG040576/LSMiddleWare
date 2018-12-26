//
//  LSRouter.h
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSRouterRequest.h"
@class UIViewController;

NS_ASSUME_NONNULL_BEGIN
typedef void(^LSRouterUnhandledCallback)(LSRouterRequest *request, UIViewController *topViewController); // 无法处理时的回调


@interface LSRouter : NSObject


/**
 请求无法处理时定义的事件
 */
@property (nonatomic, copy, nullable) LSRouterUnhandledCallback unhandledCallback;


/**
 单利

 @return 返回对象
 */
+ (instancetype)shared;


/**
 处理路由请求（比如界面跳转）

 @param request 创建带有请求信息的类
 @param completionHandler 回调方法
 */
- (void)handleRequest:(LSRouterRequest *)request
    completionHandler:(nullable LSCompletionHandler)completionHandler;


/**
 判断能否处理否个请求的路径

 @param routePath 路径
 @return 返回布尔
 */
- (BOOL)canHandleRoutePath:(NSString *)routePath; 

@end

NS_ASSUME_NONNULL_END
