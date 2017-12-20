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
#import "UIViewController+SPNavigationBarStyle.h"
#import "UIViewController+SPStatusBarStyle.h"
#import "UIImage+SPGIF.h"
#import "UIViewController+SPUIAlertController.h"
#import "UIApplication+SPAccessAuthorityOpenURL.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
//  static  float sum = 0.0f;
//    [NSTimer scheduledTimerWithTimeInterval:0.1f repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//        sum=sum +0.05f;
//           [self sp_showMBProgressHUD:@"这里是提示信息" mode:MBProgressHUDModeDeterminate progress:sum animation:YES];
//    }];
    
    
//    [self sp_showHUD:@"dasdsdfasdf" animation:YES];

//    [self sp_showPrompt:@"这里是提示信息" delayHide:5];
    
//    [self sp_showHUD:@"这里是提示消息" animation:YES];
    
    
 
//    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 100)];
//    v.backgroundColor = [UIColor blueColor];
//    [self sp_showHUDCustomView:v text:@"你好" detailText:@"详细点"];
    
    UIImage *image = [UIImage sp_animatedGIFNamed:@"pika3"];
    
    __weak __typeof (self)  weakSelf = self;
//    [self sp_addspErrorView_image:image title:@"正在加载" block:^(id sender) {
//        [weakSelf sp_removespErrorView];
//    }];
    
    
//    [self sp_addspErrorView_image:image title:@"加载" subtitle:@"请选择下面的按钮" button1_title:@"回到上一页" button2_title:@"提交反馈" button1_click_block:^(id sender) {
//        [weakSelf sp_removespErrorView];
//
//    } button2_click_block:^(id sender) {
//
//    }];
    
    
    [self sp_showAlertView_title:@"更新" ok_title:@"确定" ok_block:^(UIAlertAction * _Nullable action) {
        
        [UIApplication sp_openSystemSettingNotification];
        
    } ];
//
//    [self sp_navBar:BarStyle_BlackBGColor_WhiteTitle];
//    [self sp_statusBar:StatusBarStyle_LightContent];
    
//    [self sp_navBar_bgColor:[UIColor greenColor] titleColor:[UIColor magentaColor]];
    
//    [self sp_showHUDGIF_name:@"test"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
