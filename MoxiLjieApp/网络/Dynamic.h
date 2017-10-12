//
//  Dynamic.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/12.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dynamic : NSObject

@property (nonatomic, assign) BOOL iscollect;
@property (nonatomic, assign) BOOL ispraise;
@property (nonatomic, copy) NSString *praises;//赞
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *views;

@end
