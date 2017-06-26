//
//  UIImage+XHExt.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "UIImage+XHExt.h"

@implementation UIImage (XHExt)

+(UIImage *_Nullable)originalImageWithName:(NSString *_Nonnull)name{

    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
    
@end
