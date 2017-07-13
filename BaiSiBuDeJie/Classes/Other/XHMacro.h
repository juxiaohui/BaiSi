//
//  XHMacro.h
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/26.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#ifndef XHMacro_h
#define XHMacro_h


//**************调试和发布版本之间的设置*****************
#ifdef DEBUG //调试模式--模拟器

#define XHLog(...) NSLog(__VA_ARGS__)  //公司自定义打印

#else //发布模式 RELEASE--真机

#define XHLog(...)  //发布版本下取消自定义打印，自定义打印不起作用

#endif
//**************所有objective-c文件共享的头文件*****************


#define SH  [UIScreen mainScreen].bounds.size.height

#define SW  [UIScreen mainScreen].bounds.size.width

#define ScreenWidth  (SH < SW ? SH : SW)

#define ScreenHeight (SH > SW ? SH : SW)

#define iOS(version) ([[UIDevice currentDevice].systemVersion doubleValue]>=(version))

#define XHRGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define XHRGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define XHNormalFont(size) [UIFont systemFontOfSize:size]

#define XHBoldFont(size) [UIFont boldSystemFontOfSize:size]


#define XHCommonBgColor XHRGBColor(215,215,215);

#define XHLogFunc XHLog(@"%s", __func__);

#define XHWeakSelf __weak typeof(self) weakSelf = self;

#define XHUserDefaults [NSUserDefaults standardUserDefaults]


#endif /* XHMacro_h */
