//
//  LSRouter.m
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSRouter.h"
#import <objc/message.h>


static UIViewController *_sj_get_top_view_controller() {
    UIViewController *vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (  [vc isKindOfClass:[UINavigationController class]] || [vc isKindOfClass:[UITabBarController class]] ) {
        if ( [vc isKindOfClass:[UINavigationController class]] ) vc = [(UINavigationController *)vc topViewController];
        if ( [vc isKindOfClass:[UITabBarController class]] ) vc = [(UITabBarController *)vc selectedViewController];
        if ( vc.presentedViewController ) vc = vc.presentedViewController;
    }
    return vc;
}


@interface LSRouter()
@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, Class<LSRouteHandler>> *handlersM;
@end

@implementation LSRouter

+ (instancetype)shared {
    static id _instace;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [[self alloc] init];
    });
    return _instace;
}

- (instancetype)init {
    self = [super init];
    if ( !self ) return nil;
    _handlersM = [NSMutableDictionary new];
    
    unsigned int img_count = 0;
    const char **imgs = objc_copyImageNames(&img_count);
    const char *main = NSBundle.mainBundle.bundlePath.UTF8String;
    for ( unsigned int i = 0 ; i < img_count ; ++ i ) {
        const char *img = imgs[i];
        if ( !strstr(img, main) ) continue;
        unsigned int cls_count = 0;
        const char **classes = objc_copyClassNamesForImage(img, &cls_count);
        Protocol *p_handler = @protocol(LSRouteHandler);
        for ( unsigned int i = 0 ; i < cls_count ; ++ i ) {
            const char *cls_name = classes[i];
            NSString *cls_str = [NSString stringWithUTF8String:cls_name];
            Class cls = NSClassFromString(cls_str);
            if ( ![cls conformsToProtocol:p_handler] ) continue;
            if ( ![(id)cls respondsToSelector:@selector(handleRequestWithParameters:topViewController:completionHandler:)] ) continue;
            if ( [(id)cls respondsToSelector:@selector(routePath)] )
                _handlersM[[(id<LSRouteHandler>)cls routePath]] = cls;
            else if ( [(id)cls respondsToSelector:@selector(multiRoutePath)] ) {
                for ( NSString *rp in [(id<LSRouteHandler>)cls multiRoutePath] )
                    _handlersM[rp] = cls;
            }
        }
        if ( classes ) free(classes);
    }
    if ( imgs ){
        free(imgs);
    }
    
    /**
     
     当发送的请求无法执行的时候，进入以下模块
     
     **/
    self.unhandledCallback = ^(LSRouterRequest * _Nonnull request, UIViewController * _Nonnull topViewController) {
        
        /// 尝试用网页打开
        if ( request.originalURL && [request.originalURL.description hasPrefix:@"http"]) {
        
            
            NSLog(@"\n尝试通过网页打开, Router未能处理这个请求: %@.", request.description);
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Router未能处理这个请求" message:@"检测到网址链接,是否跳转浏览器加载？" preferredStyle:(UIAlertControllerStyleAlert)];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"跳转" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
                /** 跳转浏览器打开链接 **/
                [[UIApplication sharedApplication] openURL:request.originalURL options:@{} completionHandler:^(BOOL success) {
                    
                }];
                
            }];
            
            [alertVC addAction:action1];
            [alertVC addAction:action2];
            [topViewController presentViewController:alertVC animated:YES completion:nil];
        }
        else {
            NSLog(@"无法处理的请求: %@", request);
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"无法处理的请求" message:request.requestPath preferredStyle:(UIAlertControllerStyleAlert)];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertVC addAction:action1];
            [topViewController presentViewController:alertVC animated:YES completion:nil];
            
        }
    };
    
    return self;
}
- (void)handleRequest:(LSRouterRequest *)request completionHandler:(nullable LSCompletionHandler)completionHandler {
    NSParameterAssert(request); if ( !request ) return;
    Class<LSRouteHandler> handler = _handlersM[request.requestPath];
    if ( handler ) {
        [handler handleRequestWithParameters:request.prts topViewController:_sj_get_top_view_controller() completionHandler:completionHandler];
    }
    else {
        printf("\n (-_-) Unhandled request: %s", request.description.UTF8String);
        if ( _unhandledCallback ) _unhandledCallback(request, _sj_get_top_view_controller());
    }
}
- (BOOL)canHandleRoutePath:(NSString *)routePath {
    if ( 0 == routePath.length ){
        return NO;
    }
    return _handlersM[routePath];
}


@end
