//
//  ViewController.m
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSMiddleWareViewController.h"
#import "LSRouter.h"

@interface LSMiddleWareViewController ()

@end

@implementation LSMiddleWareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    LSRouterRequest *request = [[LSRouterRequest alloc] initWithPath:@"native:present/vc/testpage" parameters:@{@"uid":@"12345678"}];
    LSRouterRequest *request = [[LSRouterRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    
    [[LSRouter shared] handleRequest:request completionHandler:^(id  _Nullable result, NSError * _Nullable error) {
        NSLog(@" --- %@ ---",result);
    }];
}


@end
