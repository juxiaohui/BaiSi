//
//  XHNetWorkRequest.m
//  BaiSiBuDeJie
//
//  Created by jxh on 2017/7/13.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import "XHNetWorkRequest.h"


@implementation XHNetWorkRequest

+(void)xh_getRequestWithUrl:(NSString *)url isNeedCache:(BOOL)isNeedCache
                               parameters:(NSDictionary *)parameters
                             successBlock:(XHResponseSuccess)successBlock
                             failureBlock:(XHResponseFail)failureBlock
                                 progress:(XHDownloadProgress)progress{
    
    
    [BANetManager ba_request_GETWithUrlString:url isNeedCache:isNeedCache parameters:parameters successBlock:^(id response) {
        
        successBlock ? successBlock(response) : nil;
        
    } failureBlock:^(NSError *error) {
        
        failureBlock ? failureBlock(error) : nil;
        
    } progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
        progress ? progress(bytesProgress,totalBytesProgress) : nil;
    }];
}

@end
