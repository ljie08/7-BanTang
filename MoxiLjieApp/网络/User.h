//
//  User.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *is_official;
@property (nonatomic, copy) NSString *article_topic_count;
@property (nonatomic, copy) NSString *post_count;

@end
