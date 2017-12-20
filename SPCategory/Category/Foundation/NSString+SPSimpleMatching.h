//
//  NSString+SPSimpleMatching.h
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
//github address//https://github.com/lishiping/SPBaseClass

#import <Foundation/Foundation.h>

/*!
 *  判断字符串是否包含自定子串的工具方法。
 */
@interface NSString (SPSimpleMatching)

/*!
 *  判断当前字符串是否为空
 *
 *  @param string 要判断的string
 *
 *  @return YES为空，NO为非空
 */
+ (BOOL)sp_isEmptyString:(NSString *)string;

/*!
 *  判断当前字符串是否包含searchSet中的元素
 *
 *  @param searchSet 要查找的char set
 *
 *  @return YES为包含，NO为不包含
 */
- (BOOL)sp_containsCharacterInSet:(NSCharacterSet *)searchSet;

/*!
 *  判断当前字符串是否包含searchSet中的元素
 *
 *  @param searchString 要查找的string
 *  @param mask         搜索的mask值（NSStringCompareOptions）
 *
 *  @return YES包含， NO不包含
 */
- (BOOL)sp_containsString:(NSString *)searchString options:(unsigned int)mask;

/*!
 *  判断当前字符串是否包含searchString
 *
 *  @param searchString 要查找的string
 *
 *  @return YES包含， NO不包含
 */
- (BOOL)sp_containsString:(NSString *)searchString;

/*!
 *  判断当前string第一个字符是否为空字符
 *  如， “ ”，“\t”,"\r","\n"
 *
 *  @return YES，为空字符；NO，为非空字符
 */
- (BOOL)sp_hasLeadingWhitespace;

@end
