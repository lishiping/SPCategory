//
//  SPErrorView.m
//  e-mail:83118274@qq.com
//
//  Created by lishiping on 17/4/25.
//  Copyright © 2017年 lishiping. All rights reserved.
//

#import "SPErrorView.h"

@interface SPErrorView ()

@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, copy) SPButtonClickedBlock tapBlock;

@end

@implementation SPErrorView

-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title block:(SPButtonClickedBlock)block
{
    self = [super initWithFrame:frame];
    [self configureView_image:image title:title];
    self.tapBlock = block;
    return self;
}


- (void)configureView_image:(UIImage*)image title:(NSString*)title
{
    self.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    _imageView.image = image;
    [self addSubview:_imageView];
    
    _imageView.center = CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f);
    
    if (title.length>0) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 20)];
        _titleLabel.text = title;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
        
        _titleLabel.center = CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f+image.size.height/2.0f+15.0f);
    }
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSelf:)]];
}

- (void)tapSelf:(UIGestureRecognizer*)reco;
{
    if (self.tapBlock)
    {
        self.tapBlock(reco);
    }
}

@end
