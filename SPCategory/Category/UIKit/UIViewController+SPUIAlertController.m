//
//  UIViewController+SPUIAlertController.m
//  SPCategory
//
//  Created by shiping1 on 2017/11/21.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "UIViewController+SPUIAlertController.h"

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
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        if (ok_title) {
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:ok_title style:UIAlertActionStyleDefault handler:ok_block];
            [alertVC addAction:okAction];
        }
        
        if (cancel_title) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel_title style:UIAlertActionStyleCancel handler:cancel_block];
            [alertVC addAction:cancelAction];
        }
        
        [self presentViewController:alertVC animated:animated completion:completion];
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
    //标题和信息必须有一个，这样才不会显示空白信息，
    //确定和取消按钮也必须有一个,这样信息显示完要有消失的功能
    //如果不满足则不弹出警告框

    if ((title||message) && (ok_title || cancel_title))
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        
        if (ok_title) {
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:ok_title style:ok_title_style handler:ok_block];
            [alertVC addAction:okAction];
        }
        
        if (cancel_title) {
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel_title style:UIAlertActionStyleCancel handler:cancel_block];
            [alertVC addAction:cancelAction];
        }
        
        [self presentViewController:alertVC animated:animated completion:completion];
    }
}

@end
