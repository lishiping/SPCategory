//
//  NSAttributedString+SPSize.m
//  jgdc
//
//  Created by lishiping on 2019/9/28.
//  Copyright © 2019 QingClass. All rights reserved.
//

#import "NSAttributedString+SPSize.h"

@implementation NSAttributedString (SPSize)


- (CGSize)sp_getSize_maxSize:(CGSize)size
{
    CGSize contentSize = CGSizeZero;
    
    contentSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil].size;
    
    contentSize = CGSizeMake((NSUInteger)contentSize.width + 1, (NSUInteger)contentSize.height + 1);
    return contentSize;
}

@end
