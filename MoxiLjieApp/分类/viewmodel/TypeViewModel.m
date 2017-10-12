//
//  TypeViewModel.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "TypeViewModel.h"

@implementation TypeViewModel

- (instancetype)init {
    if (self = [super init]) {
        _typeList = [NSMutableArray array];
        _titleList = [NSArray arrayWithObjects: NSLocalizedString(@"设计感", nil), NSLocalizedString(@"礼物", nil), NSLocalizedString(@"学生党", nil), NSLocalizedString(@"上班族", nil), NSLocalizedString(@"美食", nil), NSLocalizedString(@"阅读", nil), NSLocalizedString(@"运动", nil), nil];
        _page = 10;
    }
    return self;
}

/**
 请求数据
 
 @param isRefresh 是否刷新
 @param type 类型 主页的slidernavbar点击的按钮对应相应的接口 默认显示最新的数据
 @param success 成功
 @param failture 失败
 */
- (void)getTypeListWithRefresh:(BOOL)isRefresh type:(NSInteger)type success:(void(^)(BOOL result))success failture:(void(^)(NSString *error))failture {
    if (isRefresh) {
        self.page = 10;
    } else {
        self.page += 10;
    }
    
    NSString *url;
    switch (type) {
        case 0:
            url = HomeDesignURL;
            break;
        case 1:
            url = HomeGiftURL;
            break;
        case 2:
            url = HomeStudentURL;
            break;
        case 3:
            url = HomeOfficeURL;
            break;
        case 4:
            url = HomeFoodURL;
            break;
        case 5:
            url = HomeReadingURL;
            break;
        case 6:
            url = HomeSportURL;
            break;
            
        default:
            break;
    }
    
    @weakSelf(self);
    [[WebManager sharedManager] getHomelistWithPage:self.page type:url success:^(NSArray *list) {
        if (weakSelf.typeList.count) {
            [weakSelf.typeList removeAllObjects];
        }
        [weakSelf.typeList addObjectsFromArray:list];
        
        success(YES);
    } failure:^(NSString *errorStr) {
        failture(errorStr);
    }];;
}

@end
