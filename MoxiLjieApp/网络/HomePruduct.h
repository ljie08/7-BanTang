//
//  HomePruduct.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePruduct : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *desc;//描述
@property (nonatomic, copy) NSString *price;//价格
@property (nonatomic, copy) NSString *product_type;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *item_id;
@property (nonatomic, copy) NSString *url;//淘宝链接
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *thumbail_pic;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSDictionary *brand;
@property (nonatomic, strong) NSArray<Picture *> *pics;

@end
