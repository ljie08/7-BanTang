//
//  Post.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *datestr;
@property (nonatomic, copy) NSString *post_type;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *is_recommend;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) Dynamic *dynamic;
@property (nonatomic, strong) User *user;

@end
