//
//  DetailViewModel.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BaseViewModel.h"

@interface DetailViewModel : BaseViewModel

@property (nonatomic, strong) NSMutableArray *detailList;
@property (nonatomic, strong) HomeModel *home;

/**
 请求数据
 
 @param detailID 根据id请求数据
 @param success 成功
 @param failture 失败
 */
- (void)getDetailListWithID:(NSString *)detailID success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

@end
