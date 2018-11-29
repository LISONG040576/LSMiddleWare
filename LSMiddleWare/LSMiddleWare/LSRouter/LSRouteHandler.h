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
+ (void)handleRequestWithParameters:(nullable LSParameters)parameters topViewController:(UIViewController *)topViewController completionHandler:(nullable LSCompletionHandler)completionHandler;

@optional
+ (NSString *)routePath;                 // 单路径 可以用这个方法返回
+ (NSArray<NSString *> *)multiRoutePath; // 多路径 可以从这个方法返回

@end

NS_ASSUME_NONNULL_END
