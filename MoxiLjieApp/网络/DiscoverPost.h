//
//  DiscoverPost.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

//发现-最新

@interface DiscoverPost : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *middle_pic_url;
@property (nonatomic, assign) BOOL is_recommend;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, copy) NSString *datestr;
@property (nonatomic, strong) NSArray *brand_product;//"0 elements"
@property (nonatomic, strong) Dynamic *dynamic;
@property (nonatomic, copy) NSString *post_type;
@property (nonatomic, copy) NSDictionary *relation_activity;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray<Picture *> *pics;
@property (nonatomic, copy) NSString *content;

@end
