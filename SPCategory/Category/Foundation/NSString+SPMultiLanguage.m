//
//  NSString+MultiLan.m
//  WBTool
//
//  Created by anyuan on 14-5-6.
//  Copyright (c) 2014年 Sina. All rights reserved.
//

#import "NSString+SPMultiLanguage.h"
#import "NSUserDefaults+SPTypeCast.h"

@implementation NSString (SPMultiLanguage)
static NSDictionary *dicLanguage = nil;

NSInteger currentLanguageCode()
{
    NSInteger lanSet = [[NSUserDefaults standardUserDefaults] sp_integerForKey:@"MulanguageSet"];
    return lanSet;
}

void clearLanguageDic()
{
    dicLanguage = nil;
}

NSString* _loadMuLanguage(NSString *keyLanguage,NSString *keyValue,NSString *modulename)
{
    NSInteger lanSet = [[NSUserDefaults standardUserDefaults] sp_integerForKey:@"MulanguageSet"];
	if (!dicLanguage) {
		switch (lanSet) {
			case 0: {
				;
				NSDictionary *dicLan = [[NSDictionary alloc] initWithContentsOfFile:
										[[NSBundle mainBundle] pathForResource:@"language_ch" ofType:@"plist"]];
				dicLanguage = dicLan;
				break;
			}
			case 1: {
				;
                NSString *language_path;

                    language_path = @"language_tw";
				NSDictionary *dicLantw = [[NSDictionary alloc] initWithContentsOfFile:
                                          [[NSBundle mainBundle] pathForResource:language_path ofType:@"plist"]];
				dicLanguage = dicLantw;
				break;
			}
			case 2: {
				;
                NSString *language_path;

                    language_path = @"language_english";
				NSDictionary *dicLanen = [[NSDictionary alloc] initWithContentsOfFile:
                                          [[NSBundle mainBundle] pathForResource:language_path ofType:@"plist"]];
				dicLanguage = dicLanen;
				break;
			}
			case 3: {
				;
				NSDictionary *dicLanMa = [[NSDictionary alloc] initWithContentsOfFile:
										  [[NSBundle mainBundle] pathForResource:@"language_Malaysia" ofType:@"plist"]];
				dicLanguage = dicLanMa;
				break;
			}
			default:
				break;
		}
	}
	NSString *strValue;
    
    if ((lanSet == 2 || lanSet == 1) ) {
        if ([[dicLanguage objectForKey:modulename] sp_hasKey:keyLanguage]) {
            strValue = [[dicLanguage objectForKey:modulename] objectForKey:keyLanguage];
        }
        else if ([[dicLanguage objectForKey:@"WBUIKitModule"] sp_hasKey:keyLanguage]) {
            strValue = [[dicLanguage objectForKey:@"WBUIKitModule"] objectForKey:keyLanguage];
        }
        else if ([[dicLanguage objectForKey:@"backup"] sp_hasKey:keyLanguage]) {
            strValue = [[dicLanguage objectForKey:@"backup"] objectForKey:keyLanguage];
        }
    }
    else
    {
        strValue = [dicLanguage objectForKey:keyLanguage];
    }

	if (strValue == nil) {
		return keyLanguage;
	} else {
		return strValue;
	}
}

NSString* _loadMuLanguageEscape(NSString *keyLanguage, NSString *keyValue, NSString *modulename)
{
    NSString *string = _loadMuLanguage(keyLanguage, keyValue, modulename);
    return [string stringByReplacingOccurrencesOfString:@"{NEW_LINE}" withString:@"\n"];
}

NSString * WBAccessibilityLocalize(NSString * key)
{
    return key;
}
@end
