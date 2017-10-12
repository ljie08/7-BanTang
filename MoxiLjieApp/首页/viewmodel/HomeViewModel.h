//
//  HomeViewModel.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel

@property (nonatomic, strong) NSMutableArray *homeList;
@property (nonatomic, assign) int page;

@property (nonatomic, strong) NSMutableArray *bannerList;
@property (nonatomic, strong) NSMutableArray *picList;

@property (nonatomic, strong) HomeModel *home;

/**
 请求数据
 
 @param detailID 根据id请求数据
 @param success 成功
 @param failture 失败
 */
- (void)getDetailListWithID:(NSString *)detailID success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

/**
 请求数据

 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getHomeListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

//banner
- (void)getHomeBannerWithSuccess:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

@end
