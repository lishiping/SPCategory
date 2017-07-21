//
//  ViewController.m
//  SPCategory
//
//  Created by uxin-lishiping on 2017/5/21.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+SPHUD.h"
#import "UIViewController+SPErrorView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
//  static  float sum = 0.0f;
//    [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//        sum=sum +0.05f;
//           [self sp_showMBProgressHUD:@"这里是提示信息" mode:MBProgressHUDModeDeterminate progress:sum animation:YES];
//    }];
    
    
//    [self showToast:@"wodhh"];
//    [self sp_showHUD:@"dasdsdfasdf" animation:YES];

//    [self sp_showPrompt:@"这里是提示信息" delayHide:5];
    
//    [self sp_showHUD:@"这里是提示消息" animation:YES];
    
    
 
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 100)];
//    v.backgroundColor = [UIColor blueColor];
//    [self sp_showHUDCustomView:v text:@"你好" detailText:@"详细点"];
    
    
    [self addspErrorViewWithTitle:@"点击重新加载"];
    __weak __typeof (self)  weakSelf = self;
    self.spErrorView.tapBlock = ^(id sender){
        [weakSelf removespErrorView];
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
