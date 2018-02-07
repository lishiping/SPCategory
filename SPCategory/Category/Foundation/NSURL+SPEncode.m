//
//  NSURL+SPEncode.m
//  SPCategory
//
//  Created by shiping li on 2018/1/30.
//  Copyright © 2018年 lishiping. All rights reserved.
//

#import "NSURL+SPEncode.h"
#import "NSString+SPEnCode.h"
#import <NSDictionary+SPSafe.h>

@implementation NSURL (SPEncode)

-(NSURL*)urlEncode
{
    NSString *absoluteString = self.absoluteString;
    
    NSDictionary *dic = [self getParamFromURLByurlEncode];
    
    NSString *parameters = [self stringForHTTPBySortParameters:dic];
    
    NSRange rg = [absoluteString rangeOfString:@"?"];
    
    NSString *urlString = [absoluteString substringToIndex:rg.location];
    urlString = [urlString stringByAppendingString:@"?"];
    urlString = [urlString stringByAppendingString:parameters];
    
    return [NSURL URLWithString:urlString];
}

-(NSURL*)urlDecode
{
    NSString *absoluteString = self.absoluteString;
    
    NSDictionary *dic = [self getParamFromURLByurlDecode];
    
    NSString *parameters = [self stringForHTTPBySortParameters:dic];
    
    NSRange rg = [absoluteString rangeOfString:@"?"];
    
    NSString *urlString = [absoluteString substringToIndex:rg.location];
    urlString = [urlString stringByAppendingString:@"?"];
    urlString = [urlString stringByAppendingString:parameters];
    
    return [NSURL URLWithString:urlString];
}

//从url得到请求参数
-(NSDictionary*)getParamFromURLByurlDecode
{
    NSArray *queryArr = [self.query componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    for (NSString *querytemp in queryArr) {
        NSArray *keyvalue = [querytemp componentsSeparatedByString:@"="];
        NSString *valuString =keyvalue[1];
        [mDic setObject:valuString.urlDecode forKey:keyvalue[0]];
    }
    
    return [mDic copy];
}

//从url得到请求参数
-(NSDictionary*)getParamFromURLByurlEncode
{
    NSArray *queryArr = [self.query componentsSeparatedByString:@"&"];
    
    NSMutableDictionary *mDic = [[NSMutableDictionary alloc] initWithCapacity:0];
    
    for (NSString *querytemp in queryArr) {
        NSArray *keyvalue = [querytemp componentsSeparatedByString:@"="];
        NSString *valuString =keyvalue[1];
        [mDic setObject:valuString.urlEncode forKey:keyvalue[0]];
    }
    
    return [mDic copy];
}

//对请求参数排序并生成字符串，为了计算md5值
- (NSString *)stringForHTTPBySortParameters:(NSDictionary*)param
{
    NSString *ret = nil;
    // 对字典key排序，保证param的顺序不影响最后结果
    NSArray *arr = [[param allKeys] sortedArrayWithOptions:NSSortConcurrent
                                           usingComparator:^NSComparisonResult(id obj1, id obj2){
                                               if (([obj1 isKindOfClass:[NSString class]]) &&
                                                   ([obj2 isKindOfClass:[NSString class]]))
                                               {
                                                   return ([obj1 compare:obj2]);
                                               }
                                               return (NSOrderedSame);
                                           }];
    if (arr.count > 0)
    {
        NSMutableArray *mArr = [NSMutableArray array];
        
        for (NSString *key in arr)
        {
            NSString *str = [NSString stringWithFormat:@"%@=%@", key, [param safe_stringForKey:key]];
            [mArr addObject:str];
        }
        
        //数组中间加上地址符
        ret = [mArr componentsJoinedByString:@"&"];
    }
    return ret;
}


@end
