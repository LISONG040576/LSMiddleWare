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

+ (instancetype)shared;

- (void)handleRequest:(LSRouterRequest *)request completionHandler:(nullable LSCompletionHandler)completionHandler;

@property (nonatomic, copy, nullable) LSRouterUnhandledCallback unhandledCallback;
- (BOOL)canHandleRoutePath:(NSString *)routePath; // 是否可以处理某个路径

@end

NS_ASSUME_NONNULL_END
