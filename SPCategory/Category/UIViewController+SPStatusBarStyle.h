//
//  UIViewController+SPStatusBarStyle.h
//  SPCategory
//
//  Created by uxin-lishiping on 2017/8/8.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import <UIKit/UIKit.h>

// 状态栏的样式
typedef NS_ENUM(NSInteger, EM_StatusBarStyle)
{
    StatusBarStyle_Default = 0,               // 默认黑色
    StatusBarStyle_LightContent = 1,          // 白色
    StatusBarStyle_Hidden,                    // 隐藏
};

@interface UIViewController (SPStatusBarStyle)

//当前设置方法可以选用，已经在ios9之后废弃了，可以使用新的方法实现
- (void)sp_statusBar:(EM_StatusBarStyle)statusBar_style;    // 状态栏的样式

//设置状态栏背景色
- (void)setStatusBarBackgroundColor:(UIColor *)color;

@end
