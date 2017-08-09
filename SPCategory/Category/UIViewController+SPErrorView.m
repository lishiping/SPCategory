//
//  UIViewController+SPErrorView.m
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 17/4/25.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "UIViewController+SPErrorView.h"
#import <objc/runtime.h>

static char spErrorViewKey;

@implementation UIViewController (SPErrorView)

-(void)addspErrorView_block:(SPButtonClickedBlock)block
{
    [self addspErrorView_image:nil title:nil block:block];
}

-(void)addspErrorView_title:(NSString *)title block:(SPButtonClickedBlock)block
{
    [self addspErrorView_image:nil title:title block:block];
}

- (void)addspErrorView_image:(UIImage *)image title:(NSString *)title block:(SPButtonClickedBlock)block
{
    for (UIView *view in self.view.subviews) {
        if ([view isMemberOfClass:[SPErrorView class]]) {
            return;
        }
    }
    if (!self.spErrorView) {
        
        if (!image) {
            NSString *pathComponent = [NSString stringWithFormat:@"%@.bundle", @"SPCategory"];
            NSString *bundlePath =[[[NSBundle bundleForClass:[self class]] resourcePath] stringByAppendingPathComponent:pathComponent];
            NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
            
            NSString *url =  [NSBundle pathForResource:@"reload_img@2x" ofType:@"png" inDirectory:bundle.bundlePath];
            image= [UIImage imageWithContentsOfFile:url];
        }
        
        self.spErrorView = [[SPErrorView alloc]initWithFrame:self.view.bounds
                                                       image:image
                                                       title:title?title:@"点击重新加载"
                                                       block:block];
        [self.view addSubview:self.spErrorView];
        [self.view bringSubviewToFront:self.spErrorView];
    }
}

-(void)removespErrorView
{
    if (self.spErrorView) {
        [self.spErrorView removeFromSuperview];
        self.spErrorView = nil;
    }
}

-(void)setSpErrorView:(SPErrorView *)spErrorView{
    objc_setAssociatedObject(self, &spErrorViewKey, spErrorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(SPErrorView *)spErrorView
{
    return objc_getAssociatedObject(self, &spErrorViewKey);
}

@end
