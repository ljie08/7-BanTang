//
//  HomeViewModel.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "HomeViewModel.h"

@implementation HomeViewModel

- (instancetype)init {
    if (self = [super init]) {
        _homeList = [NSMutableArray array];
        _bannerList = [NSMutableArray array];
        _picList = [NSMutableArray array];
        _page = 10;
    }
    return self;
}

/**
 请求数据
 
 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getHomeListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    if (isRefresh) {
        self.page = 10;
    } else {
        self.page += 10;
    }
    @weakSelf(self);
    [[WebManager sharedManager] getHomeNewWithTime:nil page:self.page success:^(NSArray *list) {
        if (weakSelf.homeList.count) {
            [weakSelf.homeList removeAllObjects];
        }
        
        [weakSelf.homeList addObjectsFromArray:list];
        
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];
}

//banner
- (void)getHomeBannerWithSuccess:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    @weakSelf(self);
    [[WebManager sharedManager] getBannerSuccess:^(NSArray *list) {
        if (weakSelf.bannerList.count) {
            [weakSelf.bannerList removeAllObjects];
            [weakSelf.picList removeAllObjects];
        }
        for (Banner *banner in list) {
            [weakSelf.bannerList addObject:banner.browser_url];
            [weakSelf.picList addObject:banner.photo];
        }
        
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];
}

/**
 请求数据
 
 @param detailID 根据id请求数据
 @param success 成功
 @param failture 失败
 */
- (void)getDetailListWithID:(NSString *)detailID success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    @weakSelf(self);
    [[WebManager sharedManager] getHomeDetailWithID:detailID success:^(HomeModel *home) {
        
        weakSelf.home = home;
        
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];
}

@end
