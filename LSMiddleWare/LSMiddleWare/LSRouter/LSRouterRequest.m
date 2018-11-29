//
//  LSRouterRequest.m
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSRouterRequest.h"

@interface LSRouterRequest ()

@end

@implementation LSRouterRequest

- (instancetype)initWithPath:(NSString *)rq parameters:(nullable LSParameters)prts {
    NSParameterAssert(rq);
    self = [super init];
    if ( !self ) return nil;
    while ( [rq hasPrefix:@"/"] ) rq = [rq substringFromIndex:1];
    _requestPath = rq.copy?:@"";
    _prts = prts;
    return self;
}





- (instancetype)initWithURL:(NSURL *)URL {
    LSParameters parameters = nil;
    NSURLComponents *c = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:YES];
    if ( 0 != c.queryItems.count ) {
        NSMutableDictionary *m = [NSMutableDictionary new];
        for ( NSURLQueryItem *item in c.queryItems ) {
            m[item.name] = item.value;
        }
        parameters = m.copy;
    }
    self = [self initWithPath:URL.path.stringByDeletingPathExtension parameters:parameters];
    if ( !self ) return nil;
    _originalURL = URL;
    return self;
}
- (NSString *)description {
    return
    [NSString stringWithFormat:@"[%@<%p>] {\n \
     requestPath = %@; \n \
     parameters = %@; \n \
     originalURL = %@; \n \
     }", NSStringFromClass([self class]), self, _requestPath, _prts, _originalURL];
}



@end
