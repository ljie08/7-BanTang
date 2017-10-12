//
//  Banner.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banner : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *topic_type;
@property (nonatomic, copy) NSString *index;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *perent_id;
@property (nonatomic, copy) NSString *sub_title;
@property (nonatomic, copy) NSString *browser_url;
@property (nonatomic, copy) NSString *is_show_icon;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *topic;
@property (nonatomic, copy) NSString *activity;
@property (nonatomic, copy) NSString *photo_width;
@property (nonatomic, copy) NSString *extend;
@property (nonatomic, strong) User *user;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *post;

@end
