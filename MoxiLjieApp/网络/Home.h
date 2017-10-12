//
//  Home.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Home : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *islike;
@property (nonatomic, copy) NSString *activity;
@property (nonatomic, strong) Product *product;
@property (nonatomic, strong) User *user;

@end
