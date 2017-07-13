//
//  XHUserDefaultsTool.h
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/6/27.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHUserDefaultsTool : NSObject

+ (nullable id)objectForKey:(NSString *_Nonnull)defaultName;

+ (void)setObject:(nullable id)value forKey:(NSString *_Nonnull)defaultName;


@end
