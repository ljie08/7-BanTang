//
//  WebManager.m
//  MyWeather
//
//  Created by lijie on 2017/7/27.
//  Copyright © 2017年 lijie. All rights reserved.
//

#import "WebManager.h"

@implementation WebManager

+ (instancetype)sharedManager {
    static WebManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://httpbin.org/"]];
    });
    return manager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 5;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}

#pragma mark - Data
#pragma mark - 首页
//首页最新
- (void)getHomeNewWithTime:(NSString *)timeStr page:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure {
    
    NSString *str = [NSString stringWithFormat: HomeNewURL, BaseMidURL, page];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", BaseURL, str, BaseLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *arrDic = [dic objectForKey:@"data"];
        NSArray *arr = [arrDic objectForKey:@"topic"];
        arr = [Topic mj_objectArrayWithKeyValuesArray:arr];
        success(arr);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

//根据类型url
- (void)getHomelistWithPage:(NSInteger)page type:(NSString *)typeUrl success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: typeUrl, BaseMidURL, page];
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@", BaseURL, HomeBaseURL, str, BaseLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *arrDic = [dic objectForKey:@"data"];
        NSArray *arr = [arrDic objectForKey:@"topic"];
        arr = [Topic mj_objectArrayWithKeyValuesArray:arr];
        
        success(arr);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

//首页详情
- (void)getHomeDetailWithID:(NSString *)idStr success:(void(^)(HomeModel *home))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: HomeDetailURL, BaseMidURL, idStr];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", BaseURL, str, DetailLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        HomeModel *model = [HomeModel mj_objectWithKeyValues:[dic objectForKey:@"data"]];
        
        NSArray *productList = [HomePruduct mj_objectArrayWithKeyValuesArray:model.product_list];
        model.product_list = productList;
        
        for (HomePruduct *product in productList) {
            
            product.pics = [Picture mj_objectArrayWithKeyValuesArray:product.pics];
        }
        success(model);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

//banner
- (void)getBannerSuccess:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: BannerURL, BaseMidURL];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", BaseURL, str, BaseLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *dataDict = [dic objectForKey:@"data"];
        NSArray *banners = [Banner mj_objectArrayWithKeyValuesArray:[dataDict objectForKey:@"banner"]];
        
        success(banners);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

#pragma mark - 发现
//最新
- (void)getDiscoverNewlistWithPage:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: DiscoverNewURL, BaseMidURL, page];
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@", BaseURL, DiscoverBaseURL, str, BaseLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *data = [dic objectForKey:@"data"];
        NSArray *list = [Discover mj_objectArrayWithKeyValuesArray:[data objectForKey:@"list"]];
        for (Discover *discover in list) {
            if (discover.post) {
                discover.post.pics = [Picture mj_objectArrayWithKeyValuesArray:discover.post.pics];
            }
            if (discover.topic) {
                discover.topic.pics = [Picture mj_objectArrayWithKeyValuesArray:discover.topic.pics];
            }
        }
        
        success(list);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

//最热
- (void)getDiscoverHotlistWithPage:(NSInteger)page success:(void(^)(NSArray *list))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: DiscoverHotURL, BaseMidURL, page];
    NSString *url = [NSString stringWithFormat:@"%@%@%@%@", BaseURL, DiscoverBaseURL, str, BaseLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSDictionary *data = [dic objectForKey:@"data"];
        NSArray *list = [Discover mj_objectArrayWithKeyValuesArray:[data objectForKey:@"list"]];
        for (Discover *discover in list) {
            discover.topic.pics = [Picture mj_objectArrayWithKeyValuesArray:discover.topic.pics];
        }
        
        success(list);
        
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

//发现详情
- (void)getDiscoverDetailWithID:(NSString *)idStr success:(void(^)(NSDictionary *dict))success failure:(void(^)(NSString *errorStr))failure {
    NSString *str = [NSString stringWithFormat: DiscoverNewDetailURL, BaseMidURL, idStr];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", BaseURL, str, DetailLastURL];
    NSLog(@"%@", url);
    [self requestWithMethod:POST WithUrl:url WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
        NSString *msg = [dic objectForKey:@"msg"];
        if ([msg isEqualToString:@"成功"]) {
            success([dic objectForKey:@"data"]);
        } else {
            success([dic objectForKey:@"msg"]);
        }
    } WithFailureBlock:^(NSError *error) {
        failure(error.localizedDescription);
    }];
}

#pragma mark - request
- (void)requestWithMethod:(HTTPMethod)method
                  WithUrl:(NSString *)url
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
         WithFailureBlock:(requestFailureBlock)failure {
    
    NSLog(@"url --> %@", url);
    
    switch (method) {
        case GET:{
            [self GET:url parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                NSLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);

                failure(error);
            }];
            break;
        }
        case POST:{
            [self POST:url parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                NSLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                NSLog(@"Error: %@", error);

                failure(error);
            }];
            break;
        }
        default:
            break;
    }
}

@end
