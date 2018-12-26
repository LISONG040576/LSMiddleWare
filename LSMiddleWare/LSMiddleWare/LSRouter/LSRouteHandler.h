//
//  LSRouteHandler.h
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef id LSParameters;

NS_ASSUME_NONNULL_BEGIN

typedef void(^LSCompletionHandler)(id _Nullable result, NSError *_Nullable error);

@protocol LSRouteHandler <NSObject>

@required

/**
 路由处理请求

 @param parameters 要传递的参数
 @param topViewController 父控制器（界面跳转使用）
 @param completionHandler 回掉处理（参数回传使用）
 */
+ (void)handleRequestWithParameters:(nullable LSParameters)parameters
                  topViewController:(UIViewController *)topViewController
                  completionHandler:(nullable LSCompletionHandler)completionHandler;

@optional

/**
 控制器URL，单路径 可以用这个方法返回

 @return 返回
 */
+ (NSString *)routePath;


/**
 控制器URL，多路径 可以从这个方法返回

 @return 返回
 */
+ (NSArray<NSString *> *)multiRoutePath;

@end

NS_ASSUME_NONNULL_END
