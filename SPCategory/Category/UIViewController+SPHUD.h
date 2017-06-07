//
//  UIViewController+HUD.h
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 17/4/25.
//  Copyright © 2017年 lishiping. All rights reserved.
//
//If you feel this open source library is of great help to you, please open the URL to the point of a great, great encouragement your recognition to the author, the author will release better open source library for you again
//如果您感觉本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会再发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory


#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (SPHUD)

/*
 Here is based on the MBProgressHUD categories can be used directly, not add to the self. The view above;Direct use of [self sp_showPrompt: @ "login succeeds"].
 
 这里是在MBProgressHUD基础上可以直接使用的类别，不用在加到self.view上面；
 直接使用 [self sp_showPrompt:@"登录成功"];
 */

/*****************sp_showPrompt(显示提示消息)*********************/
- (void)sp_showPrompt:(NSString *)message;
- (void)sp_showPrompt:(NSString *)message delayHide:(float)seconds;
- (void)sp_showPromptAddWindow:(NSString *)message;

/*****************sp_showHUD(显示活动指示器)*********************/
- (void)sp_showHUD;
- (void)sp_showHUD:(NSString *)message;
- (void)sp_showHUD:(NSString *)message animation:(BOOL)animated;

- (void)sp_showHUDInView:(UIView *)superView
                 message:(NSString *)message
               animation:(BOOL)animated;

- (void)sp_showHUDCustomView:(UIView *)customV
                        text:(NSString *)text
                  detailText:(NSString *)detailText;

- (void)sp_updateHUDMessage:(NSString *)message;

/*****************sp_showMBProgressHUD(显示自定义指示器)*********************/
- (void)sp_showMBProgressHUD:(NSString *)message
                        mode:(MBProgressHUDMode)mode
                    progress:(float)progress
                   animation:(BOOL)animated;

/**
 快捷显示MBProgressHUD
 
 @param message 显示信息
 @param mode 显示模式
 
 
 /// UIActivityIndicatorView.（默认模式, 系统自带的指示器）
 MBProgressHUDModeIndeterminate,
 
 /// A round, pie-chart like, progress view.（圆形饼图）
 MBProgressHUDModeDeterminate,
 
 /// Horizontal progress bar.（水平进度条）
 MBProgressHUDModeDeterminateHorizontalBar,
 
 /// Ring-shaped progress view.（圆环）
 MBProgressHUDModeAnnularDeterminate,
 
 /// Shows a custom view.（自定义视图）
 MBProgressHUDModeCustomView,
 
 /// Shows only labels.（只显示文字）
 MBProgressHUDModeText
 
 @param progress 进度
 
 @param animated 动画
 
 @param font 文本字体
 
 @param textColor 文本颜色
 
 @param bezelViewColor hud块背景色
 
 @param backgroundColor 全屏整体背景色
 
 */
- (void)sp_showMBProgressHUD:(NSString *)message
                        mode:(MBProgressHUDMode)mode
                    progress:(float)progress
                   animation:(BOOL)animated
                        font:(UIFont*)font
                   textColor:(UIColor*)textColor
              bezelViewColor:(UIColor*)bezelViewColor
             backgroundColor:(UIColor*)backgroundColor;


/*****************hide(隐藏指示器)*********************/
- (void)sp_hideHUD;
- (void)sp_hideHUD:(BOOL)animated;
- (void)sp_hideHUD:(BOOL)animated delay:(float)seconds;
- (void)sp_hideHUDInView:(UIView *)view delay:(float)seconds animated:(BOOL)animated;

@end
