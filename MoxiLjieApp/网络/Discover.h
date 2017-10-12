//
//  Discover.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Discover : NSObject

@property (nonatomic, copy) NSString *newid;
@property (nonatomic, copy) NSString *type_id;
@property (nonatomic, strong) Topic *topic;
@property (nonatomic, strong) DiscoverPost *post;

@end
