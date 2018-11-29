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

@property (nonatomic, strong, readonly, nullable) NSURL *originalURL;
@property (nonatomic, strong, readonly) NSString *requestPath;
@property (nonatomic, strong, readonly, nullable) LSParameters prts;

- (instancetype)initWithPath:(NSString *)requestPath parameters:(nullable LSParameters)parameters ;
- (instancetype)initWithURL:(NSURL *)URL;

@end

NS_ASSUME_NONNULL_END
