//
//  WebManager.h
//  MyWeather
//
//  Created by lijie on 2017/7/27.
//  Copyright © 2017年 lijie. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;


@interface WebManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

#pragma mark - Data
#pragma mark - 首页
//首页最新
- (void)getHomeNewWithTime:(NSString *)timeStr page:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure;
//美食、礼物、生活。。
- (void)getHomelistWithPage:(NSInteger)page type:(NSString *)typeUrl success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure;
//首页详情
- (void)getHomeDetailWithID:(NSString *)idStr success:(void(^)(HomeModel *home))success failure:(void(^)(NSString *errorStr))failure;
//banner
- (void)getBannerSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure;

#pragma mark - 发现

//最新
- (void)getDiscoverNewlistWithPage:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure;
//最热
- (void)getDiscoverHotlistWithPage:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure;
//发现详情
- (void)getDiscoverDetailWithID:(NSString *)idStr success:(void(^)(NSDictionary *dict))success failure:(void(^)(NSString *errorStr))failure;

#pragma mark - request
- (void)requestWithMethod:(HTTPMethod)method
                 WithUrl:(NSString *)url
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailureBlock:(requestFailureBlock)failure;

@end
