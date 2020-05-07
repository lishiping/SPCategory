//
//  UIView+SPBorder.m
//  jgdc
//
//  Created by lishiping on 2019/10/30.
//  Copyright © 2019 QingClass. All rights reserved.
//

#import "UIView+SPBorder.h"

@implementation UIView (SPBorder)

//-(void)sp_border_radius:(SPBorderRadius)border_radius
//{
//    CGFloat top_left = border_radius.top_left;
//    CGFloat top_right = border_radius.top_right;
//    CGFloat bottom_left = border_radius.bottom_left;
//    CGFloat bottom_right = border_radius.bottom_right;
//
//    if (top_left>0||top_right>0||bottom_left>0||bottom_right>0) {
//        CAShapeLayer *shape = [[CAShapeLayer alloc] init];
//
//        if (top_left>0) {
//            UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerTopLeft) cornerRadii:CGSizeMake(top_left,top_left)];
//            [shape setPath:rounded.CGPath];
//        }
//        if (top_right>0) {
//            UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerTopRight) cornerRadii:CGSizeMake(top_right,top_right)];
//            [shape setPath:rounded.CGPath];
//        }
//        if (bottom_left>0) {
//            UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomLeft) cornerRadii:CGSizeMake(bottom_left,bottom_left)];
//            [shape setPath:rounded.CGPath];
//        }
//        if (bottom_right>0) {
//            UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomRight) cornerRadii:CGSizeMake(bottom_right,bottom_right)];
//            [shape setPath:rounded.CGPath];
//        }
//
//        self.layer.maskedCorners = shape;
//    }
//}

-(void)sp_border_radius:(UIRectCorner)border_radius corner:(CGFloat)corner{
   return [self sp_border_radius:border_radius cornerRadii:CGSizeMake(corner, corner)];
}

-(void)sp_border_radius:(UIRectCorner)border_radius cornerRadii:(CGSize)cornerRadii
{
    if (cornerRadii.width>0||cornerRadii.height>0) {
        CAShapeLayer *shape = [[CAShapeLayer alloc] init];
        UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:border_radius cornerRadii:cornerRadii];
        [shape setPath:rounded.CGPath];
        self.layer.mask = shape;
    }
}

@end
