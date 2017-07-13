//
//  XHUserDefaultsTool.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/27.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHUserDefaultsTool.h"

@implementation XHUserDefaultsTool

+ (nullable id)objectForKey:(NSString * _Nonnull)defaultName{
    
    return [[NSUserDefaults standardUserDefaults] valueForKeyPath:defaultName];
}

+ (void)setObject:(nullable id)value forKey:(NSString * _Nonnull)defaultName{
    
    if (defaultName) {
        [[NSUserDefaults standardUserDefaults] setValue:value forKeyPath:defaultName];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
