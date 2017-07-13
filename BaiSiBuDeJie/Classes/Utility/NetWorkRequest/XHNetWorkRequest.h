//
//  XHNetWorkRequest.h
//  BaiSiBuDeJie
//
//  Created by XH on 2017/6/27.
//  Copyright © 2017年 JuXiaoHui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define XH_REQUEST_TIMEOUT 20.f

#define XH_ERROR_IMFORMATION @"网络出现错误，请检查网络连接"

#define XH_ERROR [NSError errorWithDomain:@"ErrorDomain" code:-999 userInfo:@{ NSLocalizedDescriptionKey:XH_ERROR_IMFORMATION}]

#define DIRECTORYPATH [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/"] stringByAppendingString:@"/ /"];

#define MAX_CACHE_SIZE (10 * 1024 * 1024)

@interface XHNetWorkRequest : NSObject


/**
 *  网络状态
 */
typedef NS_ENUM(NSInteger, XHNetworkStatus) {
    /**
     *  未知网络
     */
    XHNetworkStatusUnknown             = 1 << 0,
    /**
     *  无法连接
     */
    XHNetworkStatusNotReachable        = 1 << 2,
    /**
     *  网络正常
     */
    XHNetworkStatusNormal              = 1 << 3
};

/**
 *  请求方式
 */
typedef NS_ENUM(NSInteger, XHRequestType) {
    /**
     *  POST方式来进行请求
     */
    XHPOSTRequest = 1 << 0,
    /**
     *  GET方式来进行请求
     */
    XHGETRequest  = 1 << 1
};

/**
 *  数据串行方式
 */
typedef NS_ENUM(NSInteger, XHSerializerType) {
    /**
     *  HTTP方式来进行请求或响应
     */
    XHHTTPSerializer = 1 << 0,
    /**
     *  JSON方式来进行请求或响应
     */
    XHJSONSerializer = 1 << 1
};

/**
 *  请求任务
 */
typedef NSURLSessionTask XHURLSessionTask;

/**
 *  成功回调
 *
 *  @param response 成功后返回的数据
 */
typedef void(^XHResponseSuccessBlock)(id response);

/**
 *  失败回调
 *
 *  @param error 失败后返回的错误信息
 */
typedef void(^XHResponseFailBlock)(NSError *error);

/**
 *  进度
 *
 *  @param bytesRead              已下载或者上传进度的大小
 *  @param totalBytes                总下载或者上传进度的大小
 */
typedef void(^XHNetWorkingProgress)(int64_t bytesRead,
int64_t totalBytes);

/**
 *  配置请求头
 *
 *  @param httpHeaders 请求头参数
 */
+ (void)configHttpHeaders:(NSDictionary *)httpHeaders;

/**
 *  取消所有请求
 */
+ (void)cancelAllRequest;

/**
 *  根据url取消请求
 *
 *  @param url 请求url
 */
+ (void)cancelRequestWithURL:(NSString *)url;

/**
 *	获取缓存总大小
 *
 *	@return 缓存大小
 */
+ (unsigned long long)totalCacheSize;

/**
 *	清除缓存
 */
+ (void)clearCaches;

/**
 *	设置超时时间
 *
 *  @param timeout 超时时间
 */
+ (void)setupTimeout:(NSTimeInterval)timeout;

/**
 *  更新请求或者返回数据的解析方式(0为HTTP模式，1为JSON模式)
 *
 *  @param requestType  请求数据解析方式
 *  @param responseType 返回数据解析方式
 */
+ (void)updateRequestSerializerType:(XHSerializerType)requestType
                 responseSerializer:(XHSerializerType)responseType;

/**
 *  统一请求接口
 *
 *  @param url              请求路径
 *  @param params           拼接参数
 *  @param httpMethod       请求方式（0为POST,1为GET）
 *  @param useCache         是否使用缓存
 *  @param progressBlock    进度回调
 *  @param successBlock     成功回调block
 *  @param failBlock        失败回调block
 *
 *  @return 返回的对象中可取消请求
 */
+ (XHURLSessionTask *)requestWithUrl:(NSString *)url
                               params:(NSDictionary *)params
                             useCache:(BOOL)useCache
                          httpMedthod:(XHRequestType)httpMethod
                        progressBlock:(XHNetWorkingProgress)progressBlock
                         successBlock:(XHResponseSuccessBlock)successBlock
                            failBlock:(XHResponseFailBlock)failBlock;

/**
 *  图片上传接口
 *
 *	@param image            图片对象
 *  @param url              请求路径
 *	@param name             图片名
 *	@param type             默认为image/jpeg
 *	@param params           拼接参数
 *	@param progressBlock    上传进度
 *	@param successBlock     成功回调
 *	@param failBlock		失败回调
 *
 *  @return 返回的对象中可取消请求
 */
+ (XHURLSessionTask *)uploadWithImage:(UIImage *)image
                                   url:(NSString *)url
                                  name:(NSString *)name
                                  type:(NSString *)type
                                params:(NSDictionary *)params
                         progressBlock:(XHNetWorkingProgress)progressBlock
                          successBlock:(XHResponseSuccessBlock)successBlock
                             failBlock:(XHResponseFailBlock)failBlock;

/**
 *  文件上传接口
 *
 *  @param url              上传文件接口地址
 *  @param uploadingFile    上传文件路径
 *  @param progressBlock    上传进度
 *	@param successBlock     成功回调
 *	@param failBlock		失败回调
 *
 *  @return 返回的对象中可取消请求
 */
+ (XHURLSessionTask *)uploadFileWithUrl:(NSString *)url
                           uploadingFile:(NSString *)uploadingFile
                           progressBlock:(XHNetWorkingProgress)progressBlock
                            successBlock:(XHResponseSuccessBlock)successBlock
                               failBlock:(XHResponseFailBlock)failBlock;

/**
 *  文件下载接口
 *
 *  @param url           下载文件接口地址
 *  @param saveToPath    存储目录
 *  @param progressBlock 下载进度
 *  @param successBlock  成功回调
 *  @param failBlock     下载回调
 *
 *  @return 返回的对象可取消请求
 */
+ (XHURLSessionTask *)downloadWithUrl:(NSString *)url
                            saveToPath:(NSString *)saveToPath
                         progressBlock:(XHNetWorkingProgress)progressBlock
                          successBlock:(XHResponseSuccessBlock)successBlock
                             failBlock:(XHResponseFailBlock)failBlock;


@end
