//
//  Topic.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

//发现-最热
//首页

@interface Topic : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *type_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *is_recommend;
@property (nonatomic, assign) BOOL is_show_like;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) BOOL ispraise;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *praises;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *items;
@property (nonatomic, copy) NSString *update_time;
@property (nonatomic, copy) NSString *dateline;
@property (nonatomic, copy) NSString *create_time_str;
@property (nonatomic, copy) NSString *datestr;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) User *user;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *share_pic;
@property (nonatomic, copy) NSString *relation_activity;

@end
