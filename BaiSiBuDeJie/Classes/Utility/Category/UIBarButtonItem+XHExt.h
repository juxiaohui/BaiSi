//
//  UIBarButtonItem+XHExt.h
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XHExt)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+ (instancetype)itemWithImage:(NSString *)image selected:(NSString *)highImage target:(id)target action:(SEL)action;
@end
