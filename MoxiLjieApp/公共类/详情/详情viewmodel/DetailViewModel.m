//
//  DetailViewModel.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DetailViewModel.h"

@implementation DetailViewModel

- (instancetype)init {
    if (self = [super init]) {
        _detailList = [NSMutableArray array];
        _home = [[HomeModel alloc] init];
    }
    return self;
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
        if (weakSelf.detailList.count) {
            [weakSelf.detailList removeAllObjects];
        }
        weakSelf.home = home;
        [weakSelf.detailList addObjectsFromArray:home.product_list];
        
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];
}

@end
