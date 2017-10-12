//
//  Product.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *topic_id;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *title;//标题
@property (nonatomic, copy) NSString *desc;//描述
@property (nonatomic, copy) NSString *price;//价格
@property (nonatomic, copy) NSString *url;//淘宝链接
@property (nonatomic, copy) NSString *iscomments;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *islike;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, strong) Picture *pic;
@property (nonatomic, copy) NSString *item_id;
@property (nonatomic, copy) NSString *platform;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *type;

@end
