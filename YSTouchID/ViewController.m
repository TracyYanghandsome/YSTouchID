//
//  ViewController.m
//  YSTouchID
//
//  Created by yanghandsome on 2016/11/3.
//  Copyright © 2016年 yanghandsome. All rights reserved.
//

#import "ViewController.h"
#import "YSTouchID.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createTouchId];
}

- (void)_createTouchId{
    
    [[YSTouchID sharedInstance]evaluatePolicy:@"这是测试的Touch ID" fallbackTitle:@"输入密码" SuccesResult:^{
        NSLog(@"验证成功");
    } FailureResult:^(LAError result) {
        switch (result) {
            case LAErrorSystemCancel:
            {
                NSLog(@"切换到其他APP");
                break;
            }
            case LAErrorUserCancel:
            {
                NSLog(@"用户取消验证Touch ID");
                
                break;
            }
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorUserFallback:
            {
                
                NSLog(@"用户选择输入密码");
                
                break;
            }
            default:
            {
                
                NSLog(@"其他情况");
                
                break;
            }
                
        }
    }];
}


@end
