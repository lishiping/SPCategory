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

- (void)addspErrorViewWithTitle:(NSString *)title
{
    for (UIView *view in self.view.subviews) {
        if ([view isMemberOfClass:[SPErrorView class]]) {
            return;
        }
    }
    if (!self.spErrorView) {
        self.spErrorView = [[SPErrorView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        self.spErrorView.titleLabel.text = title?:@"点击重新加载";
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
