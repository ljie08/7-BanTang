//
//  TypeViewModel.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BaseViewModel.h"

@interface TypeViewModel : BaseViewModel

@property (nonatomic, strong) NSArray *titleList;
@property (nonatomic, strong) NSMutableArray *typeList;
@property (nonatomic, assign) int page;

/**
 请求数据
 
 @param isRefresh 是否刷新
 @param type 类型 主页的slidernavbar点击的按钮对应相应的接口 默认显示最新的数据
 @param success 成功
 @param failture 失败
 */
- (void)getTypeListWithRefresh:(BOOL)isRefresh type:(NSInteger)type success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture;

@end
