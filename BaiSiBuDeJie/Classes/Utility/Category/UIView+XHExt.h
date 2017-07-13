//
//  UIView+XHExt.h
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XHExt)

@property (nonatomic, assign) CGFloat xh_x;

@property (nonatomic, assign) CGFloat xh_y;

@property (nonatomic, assign) CGFloat xh_width;

@property (nonatomic, assign) CGFloat xh_height;

@property (nonatomic, assign) CGFloat xh_centerX;

@property (nonatomic, assign) CGFloat xh_centerY;

@property (nonatomic, assign) CGFloat xh_right;

@property (nonatomic, assign) CGFloat xh_bottom;

/// 设置圆角半径
-(void)setupCornerWithRadius:(CGFloat)radius;


@end
