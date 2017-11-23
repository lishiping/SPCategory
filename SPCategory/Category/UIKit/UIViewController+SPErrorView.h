//
//  UIViewController+SPErrorView.h
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


//使用类别展示错误页方便快捷，多页面复用，add和remove方法配对使用
#import <UIKit/UIKit.h>
#import "SPErrorView.h"

@interface UIViewController (SPErrorView)

@property (nonatomic, strong) SPErrorView *spErrorView;//错误页

/***************无网络等错误页***************/
//add和remove方法配对使用
-(void)sp_addspErrorView_block:(SPButtonClickedBlock)block;

/**
 在VC里面实现两个配对方法，add方法使用类别加入一个错误页，remove方法移出错误页
 
 @param image 错误页的提示图片
 @param title 错误页提示信息
 @param block 错误页点击回调，方便再次加载，可以接收点击重新加载的回调，以便刷新处理
 */
-(void)sp_addspErrorView_image:(UIImage*)image title:(NSString*)title block:(SPButtonClickedBlock)block;


/**
 在VC里面实现两个配对方法，add方法使用类别加入一个错误页，remove方法移出错误页，该方法带有两个回调按钮

 @param image 图片
 @param title 标题
 @param subtitle 子标题
 @param button1_title 按钮1名称
 @param button2_title 按钮2名称
 @param button1_click_block 按钮1回调
 @param button2_click_block 按钮2回调
 */
-(void)sp_addspErrorView_image:(UIImage*)image
                         title:(NSString*)title
                      subtitle:(NSString*)subtitle
                 button1_title:(NSString*)button1_title
                 button2_title:(NSString*)button2_title
           button1_click_block:(SPButtonClickedBlock)button1_click_block
           button2_click_block:(SPButtonClickedBlock)button2_click_block;


//当数据再次刷新成功，调用remove移出错误页
-(void)sp_removespErrorView;


@end
