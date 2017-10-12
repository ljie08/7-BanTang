//
//  HomeModel.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *type_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) BOOL ispraise;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *praises;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *share_pic;
@property (nonatomic, assign) BOOL is_show_like;
@property (nonatomic, copy) NSString *apply_activity_url;
@property (nonatomic, strong) User *user;
@property (nonatomic, copy) NSDictionary *activity;
@property (nonatomic, strong) NSArray<HomePruduct *> *product_list;

@end
