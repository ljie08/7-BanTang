//
//  DiscoverViewModel.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BaseViewModel.h"

@interface DiscoverViewModel : BaseViewModel

@property (nonatomic, strong) NSArray *titleList;
@property (nonatomic, strong) NSMutableArray *hotList;
@property (nonatomic, strong) NSMutableArray *newlist;
@property (nonatomic, assign) int page;

/**
 最热
 
 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getHotListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

/**
 最新
 
 @param isRefresh 是否刷新
 @param success 成功
 @param failture 失败
 */
- (void)getNewListWithRefresh:(BOOL)isRefresh success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

@end
