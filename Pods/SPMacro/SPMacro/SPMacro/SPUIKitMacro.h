//
//  SPUIKitMacro.h
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 16/11/11.
//  Copyright (c) 2016年 lishiping. All rights reserved.
//
//If you think this open source library is of great help to you, please open the URL to click the Star,your approbation can encourage me, the author will publish the better open source library for guys again
//如果您认为本开源库对您很有帮助，请打开URL给作者点个赞，您的认可给作者极大的鼓励，作者还会发布更好的开源库给大家

//github address//https://github.com/lishiping/SPWebView
//github address//https://github.com/lishiping/SPDebugBar
//github address//https://github.com/lishiping/SPFastPush
//github address//https://github.com/lishiping/SPMacro
//github address//https://github.com/lishiping/SafeData
//github address//https://github.com/lishiping/SPCategory
//github address//https://github.com/lishiping/SPBaseClass

#import <UIKit/UIKit.h>
#import <UIKit/UIDevice.h>
#import "SPFoundationMacro.h"


//----------------------screen size-------------------------
//----------------------屏幕尺寸-------------------------

#define SP_SCREEN_BOUND        ([UIScreen mainScreen].bounds)

#define SP_SCREEN_WIDTH         ([UIScreen mainScreen].bounds.size.width)

#define SP_SCREEN_HEIGHT        ([UIScreen mainScreen].bounds.size.height)

#define SP_SCREEN_SCALE         ([UIScreen mainScreen].scale)

#define SP_STATUSBAR_HEIGHT     ([[UIApplication sharedApplication] statusBarFrame].size.height)

#define SP_NAVIBAR_HEIGHT (self.navigationController.navigationBar.frame.size.height)



//----------------Screen adaptation--------------------
//--------------------屏幕适配---------------------------

// Usually UI to design mark could not have a variety of screen when mark respectively, too much trouble, need only gives an annotation of the screen, then we selected by default if iPhone6 screen design, according to the proportion iPhone6 screen automatically adapt to the other screen

// iphone4 iphone 5 iPhone7 are in accordance with the (w = 375) coded as a benchmark rate adaptive

// 通常UI给设计图标注的时候不可能多种屏幕分别标注，太麻烦了，需要只给一种屏幕的标注就行，那么我们默认选中只要iPhone6屏幕的设计图标注，其他屏幕根据iPhone6屏幕比例自动适应

// iphone4 iphone5 iPhone7 都按照(w=375)标注为基准比例自适应
#define SP_ADJUST_WIDTH(width)              (floorf((width) * SP_SCREEN_WIDTH/ 375.0f))

// iphone4 iphone 5 iPhone7 are in accordance with the (h=667) coded as a benchmark rate adaptive

// iphone4 iphone5 iPhone7 都按照(h=667)标注为基准比例自适应
#define SP_ADJUST_HEIGHT(height)            (floorf((height) * SP_SCREEN_HEIGHT/ 667.0f))


//---------------Judging device screen---------------------
//--------------------判断设备屏幕---------------------------

//iphone4的屏幕
#define SP_IS_IPHONE4_4S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [UIScreen mainScreen].bounds.size) : NO)

//iphone5的屏幕
#define SP_IS_IPHONE5_5S ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 568), [UIScreen mainScreen].bounds.size) : NO)

//iphone6和iPhone7的屏幕
#define SP_IS_IPHONE6_6S_7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(375, 667), [UIScreen mainScreen].bounds.size): NO)

//iphone6P和iPhone7P的屏幕
#define SP_IS_IPHONE6P_6SP_7P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(414, 736), [UIScreen mainScreen].bounds.size) : NO)

//iPad Air,iPad Air2,iPad Pro9.7inch,iPad Retina的屏幕
#define SP_IS_IPAD_AIR_AIR2_PRO9_RETINA ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(768, 1024), [UIScreen mainScreen].bounds.size) : NO)

//iPad Pro12.9inch的屏幕
#define SP_IS_IPAD_PRO12 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1024, 1366), [UIScreen mainScreen].bounds.size) : NO)

//--------------------Font---------------------------
//--------------------字体---------------------------

#define SP_FONT(size)        [UIFont systemFontOfSize:(size)]
#define SP_FONT_B(size)      [UIFont boldSystemFontOfSize:(size)]
#define SP_FONT_NAME_SIZE(name,size) [UIFont fontWithName:(name) size:(size)]

//细体字
#define SP_FONT_SIZE_LIGHT(size) [UIFont systemFontOfSize:fontSize weight:UIFontWeightUltraLight];
//常规字
#define SP_FONT_SIZE_REGULAR(size) [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
//粗体字
#define SP_FONT_SIZE_BOLD(size) [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];

//-------------------Color---------------------------
//--------------------颜色---------------------------

#define SP_COLOR_RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define SP_COLOR_RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a/1.0]

//Hexadecimal color to color object
//16进制数转为颜色对象
//SP_COLOR_RGB(0X1E1E1E);
#define SP_COLOR_HEX_RGB(hexValue) [UIColor colorWith\
Red     :(hexValue & 0xFF0000)     / (float)0xFF0000 \
green   :(hexValue & 0xFF00)       / (float)0xFF00 \
blue    :(hexValue & 0xFF)         / (float)0xFF \
alpha   :1.0]

//16进制数转为颜色对象
//SP_COLOR_RGBA(0X1E1E1E);
#define SP_COLOR_HEX_RGBA(hexValue) [UIColor colorWith\
Red     :(hexValue & 0xFF000000)  / (float)0xFF000000 \
green   :(hexValue & 0xFF0000)    / (float)0xFF0000 \
blue    :(hexValue & 0xFF00)      / (float)0xFF00 \
alpha   :(hexValue & 0xFF)        / (float)0xFF]

//Hexadecimal string color to the color object
//16进制字符串颜色转为颜色对象
//SP_COLOR_HEX(@"#1E1E1E");
#define SP_COLOR_HEX_STR(hexstring)       [SPUIKitMacro colorWithHexString:(hexstring)]


//--------------------image---------------------------
//--------------------图片---------------------------

#define SP_IMAGE(name)           [UIImage imageNamed:(name)]
#define SP_IMAGE_VIEW(name)      [[UIImageView alloc] initWithImage:SP_IMAGE(name)]

#define SP_IMAGE_FILE(file)        [UIImage imageWithContentsOfFile:file]
#define SP_IMAGE_CG(x)        [UIImage imageWithCGImage:(x)]
#define SP_IMAGE_DATA(data)      [UIImage imageWithData:(data)]

//view to image
//根据视图截屏
#define SP_IMAGE_CAPTURE(view)     [SPUIKitMacro captureWithView:view];

//获取指定大小的图片，等比例
#define SP_IMAGE_COMPRESS(image,size)     [SPUIKitMacro compressImage:image toSize:size];

//获取图片根据给定颜色
#define SP_IMAGE_BY_COLOR(color)     [SPUIKitMacro createImageWithColor:color];


//--------------------AlertView---------------------------
//--------------------警告框---------------------------

#define SP_SHOW_ALERT(message)   _ShowAlertView(0, nil, (message), nil, @"确定", nil)

#define SP_SHOW_ALERTVIEW(_tag_, title, msg, _delegate_, cancelTitle, ...) {\
UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title\
message: msg\
delegate: _delegate_\
cancelButtonTitle: cancelTitle\
otherButtonTitles: __VA_ARGS__];\
alert.tag = _tag_;\
[alert show];\
}



//--------------------ios Version---------------------
//--------------------ios版本---------------------------

#define SP_IOS_VERSION  [SPUIKitMacro getSystemVersion]

//该方法不准确，只对于整数版本准确，如果输入9.2判断不对因为实际版本9.2.1转为float值为9.199998，小于9.2，所以不能输入小数
#define SP_IOS_VERSION_OR_lALTER(v)  {[SPUIKitMacro getSystemVersion]>=v?YES:NO}

//以下判断准确可用
#define SP_IOS5_OR_LATER SP_IOS_VERSION_OR_lALTER(5)
#define SP_IOS6_OR_LATER SP_IOS_VERSION_OR_lALTER(6)
#define SP_IOS7_OR_LATER SP_IOS_VERSION_OR_lALTER(7)
#define SP_IOS8_OR_LATER SP_IOS_VERSION_OR_lALTER(8)
#define SP_IOS9_OR_LATER SP_IOS_VERSION_OR_lALTER(9)
#define SP_IOS10_OR_LATER SP_IOS_VERSION_OR_lALTER(10)


//--------------------打印---------------------------

//遍历子视图打印指针地址
#define SP_PRINT_AllVIEW(view)        [SPUIKitMacro printAllViews:view]

//-----------------------------------------------

@interface SPUIKitMacro : NSObject

/**
 获取系统版本，不准确，如系统版本9.2.1，则返回9.199998
 
 @return 系统版本
 */
+(float)getSystemVersion;

/**
 16进制#开头的字符串颜色转为颜色对象
 
 @param color 16进制字符串
 
 @return 颜色对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 打印当前视图名称和指针地址以及子视图的遍历打印
 
 @param view 当前视图
 */
+(void)printAllViews:(UIView *)view;


+ (UIImage*)createImageWithColor:(UIColor *)color;

/**
 视图转为图片
 
 @param view 视图对象
 
 @return 图片对象
 */
+ (UIImage *)captureWithView:(UIView *)view;

/**
 *  获取指定大小的图片，保存原图片比例
 *
 *  @param size  指定大小
 *
 *  @return 符合要求的图片
 */
+ (UIImage *)compressImage:(UIImage*)image toSize:(CGSize)size;

@end

