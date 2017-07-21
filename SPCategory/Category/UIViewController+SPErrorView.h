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

//使用类别展示错误页方便快捷，多页面复用，add和remove方法配对使用
#import <UIKit/UIKit.h>
#import "SPErrorView.h"

@interface UIViewController (SPErrorView)

@property (nonatomic, strong) SPErrorView *spErrorView;//错误页

/***************无网络等错误页***************/
//add和remove方法配对使用
-(void)addspErrorViewWithTitle:(NSString*)title;

//在VC代码里面addspErrorViewWithTitle的后面，实现下面的方法，可以接收点击重新加载的回调，以便刷新处理
//        _var_weakSelf;
//        self.spErrorView.tapBlock = ^(id sender){
////            [weakSelf requestData];
//        };

//当数据再次刷新成功，调用remove移出错误页
-(void)removespErrorView;


@end
