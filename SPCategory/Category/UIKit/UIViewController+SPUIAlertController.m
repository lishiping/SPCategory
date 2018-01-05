//
//  UIViewController+SPUIAlertController.m
//  SPCategory
//
//  Created by shiping1 on 2017/11/21.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "UIViewController+SPUIAlertController.h"
#import <objc/runtime.h>

static char spAlertVCKey;

@implementation UIViewController (SPUIAlertController)

#pragma mark - AlertView

-(void)sp_showAlertView_title:(NSString*)title
                     ok_title:(NSString*)ok_title
                     ok_block:(SPIdClickedBlock)ok_block
{
    [self sp_showAlertView_title:title message:nil animated:YES ok_title:ok_title ok_block:ok_block completion:nil];
}

-(void)sp_showAlertView_title:(NSString*)title
                      message:(NSString*)message
                     ok_title:(NSString*)ok_title
                     ok_block:(SPIdClickedBlock)ok_block
{
    [self sp_showAlertView_title:title message:message animated:YES ok_title:ok_title ok_block:ok_block completion:nil];
}

-(void)sp_showAlertView_title:(NSString*)title
                      message:(NSString*)message
                     animated: (BOOL)flag
                     ok_title:(NSString*)ok_title
                     ok_block:(SPIdClickedBlock)ok_block
                   completion:(void (^ __nullable)(void))completion
{
    [self sp_showAlertView_title:title message:message ok_title:ok_title cancel_title:nil animated:flag ok_block:ok_block cancel_block:nil completion:completion];
}

-(void)sp_showAlertView_title:(NSString*)title
                      message:(NSString*)message
                     ok_title:(NSString*)ok_title
                 cancel_title:(NSString*)cancel_title
                     ok_block:(SPIdClickedBlock)ok_block
                 cancel_block:(SPIdClickedBlock)cancel_block
{
    [self sp_showAlertView_title:title message:message ok_title:ok_title cancel_title:cancel_title animated:YES ok_block:ok_block cancel_block:cancel_block completion:nil];
}

-(void)sp_showAlertView_title:(NSString*)title
                      message:(NSString*)message
                     ok_title:(NSString *)ok_title
                 cancel_title:(NSString *)cancel_title
                     animated:(BOOL)animated
                     ok_block:(SPIdClickedBlock)ok_block
                 cancel_block:(SPIdClickedBlock)cancel_block
                   completion:(void (^ _Nullable)(void))completion

{
    //标题和信息必须有一个，这样才不会显示空白信息，
    //确定和取消按钮也必须有一个,这样信息显示完要有消失的功能
    //如果不满足则不弹出警告框
    if ((title||message) && (ok_title || cancel_title))
    {
        //UIAlertController是ios8提出的代替alertView的类，和block结合比代理的方式更好
        UIAlertController *spAlertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        self.spAlertVC = spAlertVC;
        
        if (ok_title.length>0) {
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:ok_title style:UIAlertActionStyleDefault handler:ok_block];
            [spAlertVC addAction:okAction];
        }
        
        if (cancel_title.length>0) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel_title style:UIAlertActionStyleCancel handler:cancel_block];
            [spAlertVC addAction:cancelAction];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:spAlertVC animated:animated completion:completion];
        });
    }
}

#pragma mark - ActionSheet
-(void)sp_showActionSheet_title:(NSString*_Nullable)title
                        message:(NSString*_Nullable)message
                       ok_title:(NSString*_Nullable)ok_title
                   cancel_title:(NSString*_Nullable)cancel_title
                       ok_block:(SPIdClickedBlock _Nullable)ok_block
                   cancel_block:(SPIdClickedBlock _Nullable)cancel_block
{
    [self sp_showActionSheet_title:title message:message ok_title:ok_title cancel_title:cancel_title animated:YES ok_title_style:UIAlertActionStyleDestructive ok_block:ok_block cancel_block:cancel_block completion:nil];
}

-(void)sp_showActionSheet_title:(NSString*_Nullable)title
                        message:(NSString*_Nullable)message
           ok_title_destructive:(NSString*_Nullable)ok_title_destructive
                   cancel_title:(NSString*_Nullable)cancel_title
                       ok_block:(SPIdClickedBlock _Nullable)ok_block
                   cancel_block:(SPIdClickedBlock _Nullable)cancel_block
{
    [self sp_showActionSheet_title:title message:message ok_title:ok_title_destructive cancel_title:cancel_title animated:YES ok_title_style:UIAlertActionStyleDestructive ok_block:ok_block cancel_block:cancel_block completion:nil];
}

-(void)sp_showActionSheet_title:(NSString*_Nullable)title
                        message:(NSString*_Nullable)message
               ok_title_default:(NSString*_Nullable)ok_title_default
                   cancel_title:(NSString*_Nullable)cancel_title
                       ok_block:(SPIdClickedBlock _Nullable)ok_block
                   cancel_block:(SPIdClickedBlock _Nullable)cancel_block
{
    [self sp_showActionSheet_title:title message:message ok_title:ok_title_default cancel_title:cancel_title animated:YES ok_title_style:UIAlertActionStyleDefault ok_block:ok_block cancel_block:cancel_block completion:nil];
}

-(void)sp_showActionSheet_title:(NSString *)title
                        message:(NSString * _Nullable)message
                       ok_title:(NSString * _Nullable)ok_title
                   cancel_title:(NSString * _Nullable)cancel_title
                       animated:(BOOL)animated
                 ok_title_style:(UIAlertActionStyle)ok_title_style
                       ok_block:(SPIdClickedBlock _Nullable)ok_block
                   cancel_block:(SPIdClickedBlock _Nullable)cancel_block
                     completion:(void (^ _Nullable)(void))completion

{
    //标题和信息可无，参照微信中有这么做的
    //确定和取消按钮必须都有这样才能有选择
    //如果不满足则不弹出警告框

    if (ok_title.length>0 && cancel_title.length>0)
    {
        UIAlertController *spAlertVC = [UIAlertController alertControllerWithTitle:title?:@"" message:message?:@"" preferredStyle:UIAlertControllerStyleActionSheet];
        
        self.spAlertVC = spAlertVC;

        if (ok_title.length>0) {
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:ok_title style:ok_title_style handler:ok_block];
            [spAlertVC addAction:okAction];
        }
        
        if (cancel_title.length>0) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel_title style:UIAlertActionStyleCancel handler:cancel_block];
            [spAlertVC addAction:cancelAction];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:spAlertVC animated:animated completion:completion];
        });
    }
}

-(void)sp_removespAlertVC
{
    if (self.spAlertVC) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.spAlertVC dismissViewControllerAnimated:NO completion:nil];
            self.spAlertVC = nil;
        });
    }
}

#pragma mark - runtime 
-(void)setSpAlertVC:(UIAlertController *)spAlertVC
{
    objc_setAssociatedObject(self, &spAlertVCKey, spAlertVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIAlertController *)spAlertVC
{
    return objc_getAssociatedObject(self, &spAlertVCKey);
}

@end
