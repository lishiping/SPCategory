//
//  UIView+SPReuseIdentifier.h
//  SPCategory
//
//  Created by shiping li on 2018/1/30.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SPReuseIdentifier)

//提供当前cell的复用ID
+(NSString*)sp_reuseIdentifier;

@end
