//
//  NSURL+SPEncode.h
//  SPCategory
//
//  Created by shiping li on 2018/1/30.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SPEncode)


/**
 url编码

 @return 编码后的url
 */
-(NSURL*)urlEncode;

/**
 url解码

 @return 解码后的url
 */
-(NSURL*)urlDecode;


/**
 获得url的参数并解码

 @return 参数字典
 */
-(NSDictionary*)getParamFromURLByurlDecode;

/**
 获得url参数并编码

 @return 参数字典
 */
-(NSDictionary*)getParamFromURLByurlEncode;

@end
