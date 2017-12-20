//
//  NSString+MultiLan.h
//  WBTool
//
//  Created by anyuan on 14-5-6.
//  Copyright (c) 2014年 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>

#define WBAppLanguageDidChangeNotification @"WBAppLanguageDidChangeNotification"

/*!
 *  NSString 关于读取多语言的工具方法
 */
@interface NSString (SPMultiLanguage)
/*!
 *  取得当前MulanguageSet
 *
 *  @return 返回当前MulanguageSet
 */
NSInteger currentLanguageCode();

/**
 *  清除当前语言字典
 */
void clearLanguageDic();

/*!
 *  获取对应多语言的字符串
 *
 *  @param keyLanguage 取得对应语言的key
 *  @param keyValue    nil
 *
 *  @return 对应多语言的字符串
 */
#define loadMuLanguage(keyLanguage,keyValue) \
  _loadMuLanguage((keyLanguage),(keyValue),nil)

NSString* _loadMuLanguage(NSString *keyLanguage,NSString *keyValue,NSString *modulename);

/*!
 *  读取多语言字符串，有换行标记的进行换行
 *
 *  @param keyLanguage 取得对应语言的key
 *  @param keyValue    nil
 *
 *  @return 对应多语言的字符串
 */
#define loadMuLanguageEscape(keyLanguage,keyValue) \
        _loadMuLanguageEscape((keyLanguage),(keyValue),nil)

NSString* _loadMuLanguageEscape(NSString *keyLanguage, NSString *keyValue, NSString *modulename);

/*!
 *  获取AccessibilityLocalize字符串，目前只返回了传入的key
 *
 *  @param key 要转换的字符串
 *
 *  @return AccessibilityLocalize字符串
 */
NSString * WBAccessibilityLocalize(NSString * key);
@end
