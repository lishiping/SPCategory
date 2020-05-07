//
//  UIView+SPBorder.h
//  jgdc
//
//  Created by lishiping on 2019/10/30.
//  Copyright © 2019 QingClass. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//typedef struct SPBorderRadius {
//    CGFloat top_left, top_right, bottom_left, bottom_right;
//} SPBorderRadius;
//
//CG_INLINE SPBorderRadius
//SPBorderRadiusMake(CGFloat top_left, CGFloat top_right, CGFloat bottom_left, CGFloat bottom_right)
//{
//    SPBorderRadius border;
//    border.top_left = top_left;
//    border.top_right = top_right;
//    border.bottom_left = bottom_left;
//    border.bottom_right = bottom_right;
//    return border;
//}
@interface UIView (SPBorder)


/**
 给view增加四个角单独设置圆角的功能

 @param border_radius 设置上左，上右，下左，下右的圆角
 */
//-(void)sp_border_radius:(SPBorderRadius)border_radius;



/**
 给view增加四个角单独设置圆角的功能

 @param border_radius 四个圆角
 @param corner 圆角大小
 */
-(void)sp_border_radius:(UIRectCorner)border_radius corner:(CGFloat)corner;

/**
 给view增加四个角单独设置圆角的功能
 [cell sp_border_radius:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0f, 10.0f)];

 @param border_radius 设置上左，上右，下左，下右的圆角
 @param cornerRadii 圆角尺寸
 */
-(void)sp_border_radius:(UIRectCorner)border_radius cornerRadii:(CGSize)cornerRadii;

@end

NS_ASSUME_NONNULL_END
