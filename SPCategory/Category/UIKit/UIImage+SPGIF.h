//
//  UIImage+SPGIF.h
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 17/4/25.
//  Copyright © 2017年 lishiping. All rights reserved.
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

@interface UIImage (SPGIF)


/**
 从gif文件名初始化image对象

 @param name gif文件名
 @return 返回gif生成的image对象
 */
+ (UIImage *)sp_animatedGIFNamed:(NSString *)name;

/**
 从gif文件数据初始化UIImage

 @param data gif图数据
 @return 返回gif生成的iamge对象
 */
+ (UIImage *)sp_animatedGIFWithData:(NSData *)data;

- (UIImage *)sp_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end
