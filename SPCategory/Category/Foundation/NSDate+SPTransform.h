//
//  NSDate+spUtilities.h
//  spool
//
//  Created by kevin on 14-7-21.
//  Copyright (c) 2014年 Sina. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 *  将NSDate转换成相应文字描述字符串的工具方法。
 */

typedef enum{
    
    spimeDisplayDescription_JustNow,
    
    spimeDisplayDescription_InOneDay,
    
    spimeDisplayDescription_InYesterday,
    
    spimeDisplayDescription_InOneHour,
    
    spimeDisplayDescription_InOneYear,
    
    spimeDisplayDescription_Other,
    
}spimeDisplayDescription;

@interface NSDate (SPTransform)

/*!
 *  将日期形式的字符串转换成NSDate
 *
 *  @param timeString 要转换为NSDate的NSString
 *
 *  @return 转换后的NSDate
 */
+ (NSDate *)sp_dateWithLocalNaturalLanguageString:(NSString *)timeString;

/*!
 *  根据指定的NSTimeInterval，生成并返回转换成时间格式的NSString对象
 *  如“今天 12：30”
 *
 *  @param t 需要转换的NSTimeInterval
 *
 *  @return 转换后的NSString
 */
+ (NSString *)sp_convertToTimeHeadFromTimeInterval:(NSTimeInterval)t;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“2分钟前”
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_relativeFormattedString;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“刚刚”
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_generalRelativeFormattedString;
- (NSString *)sp_generalRelativeFormattedStringWithTimeDescription:(spimeDisplayDescription *)description;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“3周前”
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_briefRelativeFormattedString;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“12：35”或 如果转换日期不是今日，显示“4月20日 12：35”
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_dateTimeString;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“2014-04-21 12:40“
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_formattedStringForMessageBoxDetailList;

/*!
 *  根据当前的NSDate，生成并返回一个相对时间描述的NSString对象
 *  如“昨天“
 *
 *  @return 转换后的NSString
 */
- (NSString *)sp_detailedrelativeFormattedString;

/*!
 *  根据指定的时间格式字符串，生成并返回一个当前日期的NSString对象
 *
 *  @param formatterString 格式化String
 *
 *  @return 格式化NSDate后的string
 */
- (NSString *)sp_stringWithFormatter:(NSString *)formatterString;

/*!
 *  将本身转换成一个绝对的格式返回“2014-04-21 12:40“
 */
- (NSString *)sp_formattedStringForStatusDetail;

/*！
 * 当判断当前的 NSDate 是否是今年
 *
 *  @return YES for 今年
 */
- (BOOL)sp_thisYear;

/**
 *  判断是否为今天
 *
 *  @return 判断是否为今天
 */
- (BOOL)sp_today;

@end

// NSDateFormatter 与 NSCalendar 的初始化非常慢（“比文字绘制还慢” by instruments），
// 但它们又不是线程安全的：
// http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html#//apple_ref/doc/uid/10000057i-CH12-122647-BBCCEGFF
// 以下两个方法按当前线程提供缓存过的 formatter 与 calendar

@interface NSDateFormatter (spUtilities)

+ (instancetype)sp_dateFormatterForCurrentThread;

/**
 *  @abstract   返回cache的唯一formatter
 *  @discussion 依据文档iOS7以后NSDateFormatter已经是线程安全，只需要缓存一份即可，不用每个线程都初始化消耗性能（）
 *  @return     实例化的formatter
 */
+ (instancetype)sp_dateFormatterSingle;


@end

@interface NSCalendar (SPTransform)

+ (instancetype)sp_calendarForCurrentThread;

@end
