//
//  NSString+spSimpleMatching.h
//  spool
//
//  Created by kevin on 14-7-21.
//  Copyright (c) 2014年 Sina. All rights reserved.
//

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
