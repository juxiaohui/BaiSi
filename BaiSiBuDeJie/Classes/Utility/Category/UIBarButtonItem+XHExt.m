//
//  UIBarButtonItem+XHExt.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "UIBarButtonItem+XHExt.h"

@implementation UIBarButtonItem (XHExt)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView * containView = [[UIView alloc]initWithFrame:button.bounds];
    [containView addSubview:button];
    
    return [[self alloc]initWithCustomView:containView];
}

+ (instancetype)itemWithImage:(NSString *)image selected:(NSString *)selImage target:(id)target action:(SEL)action{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:selImage] forState:UIControlStateSelected];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIView * containView = [[UIView alloc]initWithFrame:button.bounds];
    [containView addSubview:button];
    
    return [[self alloc]initWithCustomView:containView];
}


@end
