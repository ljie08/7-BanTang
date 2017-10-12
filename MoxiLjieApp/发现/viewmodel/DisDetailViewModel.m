//
//  DisDetailViewModel.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DisDetailViewModel.h"

@implementation DisDetailViewModel

/**
 请求数据
 
 @param detailID 根据id请求数据
 @param success 成功
 @param failture 失败
 */
- (void)getDetailListWithID:(NSString *)detailID success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    [[WebManager sharedManager] getDiscoverDetailWithID:detailID success:^(NSDictionary *dict) {
        NSLog(@"....%@....", dict);
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];
}

@end
