//
//  LSRouterRequest.h
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSRouteHandler.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSRouterRequest : NSObject



/**
 web url
 */
@property (nonatomic, strong, readonly, nullable) NSURL *originalURL;
/**
 界面URL
**/
@property (nonatomic, strong, readonly) NSString *requestPath;

/**
 传递的参数
 */
@property (nonatomic, strong, readonly, nullable) LSParameters prts;



/**
 初始化方法

 @param requestPath 请求界面URL
 @param parameters 携带的参数
 @return 实例对象
 */
- (instancetype)initWithPath:(NSString *)requestPath
                  parameters:(nullable LSParameters)parameters;


/**
 用于webUrl的请求

 @param URL http地址
 @return 返回
 */
- (instancetype)initWithURL:(NSURL *)URL;

@end

NS_ASSUME_NONNULL_END
