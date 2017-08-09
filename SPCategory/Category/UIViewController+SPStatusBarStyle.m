//
//  UIViewController+SPStatusBarStyle.m
//  SPCategory
//
//  Created by uxin-lishiping on 2017/8/8.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "UIViewController+SPStatusBarStyle.h"

@implementation UIViewController (SPStatusBarStyle)

- (void)sp_statusBar:(EM_StatusBarStyle)statusBar_style
{
    switch (statusBar_style)
    {
        case StatusBarStyle_Default:
        default:;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
            break;
            
        case StatusBarStyle_LightContent:
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
            break;
            
        case StatusBarStyle_Hidden:
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
            break;
    }
}

- (void)setStatusBarBackgroundColor:(UIColor *)color
{
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
