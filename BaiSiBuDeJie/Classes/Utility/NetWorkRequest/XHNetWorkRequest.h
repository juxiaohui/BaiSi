//
//  XHNetWorkRequest.h
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/7/13.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BANetManager.h>

/*! 定义请求成功的 block */
typedef void( ^ XHResponseSuccess)(id response);
/*! 定义请求失败的 block */
typedef void( ^ XHResponseFail)(NSError *error);

/*! 定义下载进度 block */
typedef void( ^ XHDownloadProgress)(int64_t bytesProgress, int64_t totalBytesProgress);

@interface XHNetWorkRequest : NSObject

+(void)xh_getRequestWithUrl:(NSString *)url isNeedCache:(BOOL)isNeedCache
    parameters:(NSDictionary *)parameters
    successBlock:(XHResponseSuccess)successBlock
    failureBlock:(XHResponseFail)failureBlock
    progress:(XHDownloadProgress)progress;

@end
