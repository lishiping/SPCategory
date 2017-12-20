//
//  UIApplication+SPAccessAuthorityOpenURL.h
//  SPCategory
//
//  Created by shiping li on 2017/12/20.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SPAccessAuthorityOpenURL)

//判断ios系统的通知权限是否开通
+(void)sp_allowPushBlock:(void(^)(BOOL succeed))block;

//跳到系统设置页的通知
+(void)sp_openSystemSettingNotification;

@end
