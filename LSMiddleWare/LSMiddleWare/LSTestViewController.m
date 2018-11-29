//
//  LSTestViewController.m
//  LSMiddleWare
//
//  Created by 海尔智能-李松 on 2018/11/29.
//  Copyright © 2018 lisong. All rights reserved.
//

#import "LSTestViewController.h"

@interface LSTestViewController ()

@property (nonatomic, copy, nullable) LSCompletionHandler completionHandler;

@end

@implementation LSTestViewController

+(NSString *)routePath{
    return @"native:present/vc/testpage";
}

+ (void)handleRequestWithParameters:(LSParameters)parameters topViewController:(UIViewController *)topViewController completionHandler:(LSCompletionHandler)completionHandler{
    
    NSLog(@" --- %@ --- ",parameters);
    
    LSTestViewController * testVc = [LSTestViewController new];
    testVc.completionHandler = completionHandler;
    [topViewController presentViewController:testVc animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
