//
//  UIApplication+SPAccessAuthorityOpenURL.m
//  SPCategory
//
//  Created by shiping li on 2017/12/20.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "UIApplication+SPAccessAuthorityOpenURL.h"
#import <UserNotifications/UserNotifications.h>

@implementation UIApplication (SPAccessAuthorityOpenURL)


+(void)sp_allowPushBlock:(void(^)(BOOL succeed))block
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    
    //监视通知开关
    //iOS 10 使用以下方法注册，才能得到授权
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    // 获取当前的通知授权状态, UNNotificationSettings
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        //        NSLog(@"%s\nline:%@\n-----\n%@\n\n", __func__, @(__LINE__), settings);
        if (settings.authorizationStatus == UNAuthorizationStatusNotDetermined) {
            NSLog(@"未选择");
            block(NO);
        } else if (settings.authorizationStatus == UNAuthorizationStatusDenied) {
            NSLog(@"未授权");
            block(NO);
        } else if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
            NSLog(@"已授权");
            block(YES);
        }
        else
        {
            block(NO);
        }
    }];
#else
    //ios8.0-10.0
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (UIUserNotificationTypeNone == setting.types) {
        NSLog(@"推送关闭 8.0,用户不允许通知!");
        block(NO);
    }
    else
    {
        NSLog(@"推送打开 8.0");
        block(YES);
    }
    
#endif
    
#else
    
    //ios3.0-8.0
    UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    
    if(UIRemoteNotificationTypeNone == type){
        NSLog(@"推送关闭");
        block(NO);
    }
    else
    {
        NSLog(@"推送打开");
        block(YES);
    }
    
#endif
    
}

+(void)sp_openSystemSettingNotification
{
    NSString *settingStr = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0f) {
        settingStr =UIApplicationOpenSettingsURLString;
    } else {
        settingStr =@"prefs:root=NOTIFICATIONS_ID";
    }
    
    NSURL *url  = [NSURL URLWithString:settingStr];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=10.0f)
        {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }
        else{
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

@end
