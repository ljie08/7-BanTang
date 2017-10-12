//
//  DiscoverViewModel.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DiscoverViewModel.h"

@implementation DiscoverViewModel

- (instancetype)init {
    if (self = [super init]) {
        _hotList = [NSMutableArray array];
        _newlist = [NSMutableArray array];
        _titleList = [NSArray arrayWithObjects:NSLocalizedString(@"最新", nil), NSLocalizedString(@"热门", nil), nil];
        _page = 10;
    }
    return self;
}

/**
 最热
 
 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getHotListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    if (isRefresh) {
        self.page = 10;
    } else {
        self.page += 10;
    }
    
    @weakSelf(self);
    [[WebManager sharedManager] getDiscoverHotlistWithPage:self.page success:^(NSArray *list) {
        if (weakSelf.hotList.count) {
            [weakSelf.hotList removeAllObjects];
        }
        [weakSelf.hotList addObjectsFromArray:list];
        
        success(YES);
    } failure:^(NSString *errorStr) {
        
        failture(errorStr);
    }];
}

/**
 最新
 
 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getNewListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    if (isRefresh) {
        self.page = 10;
    } else {
        self.page += 10;
    }
    
    @weakSelf(self);
    [[WebManager sharedManager] getDiscoverNewlistWithPage:self.page success:^(NSArray *list) {
        if (weakSelf.newlist.count) {
            [weakSelf.newlist removeAllObjects];
        }
        [weakSelf.newlist addObjectsFromArray:list];
        
        success(YES);
    } failure:^(NSString *errorStr) {
        
        failture(errorStr);
    }];
}

@end
