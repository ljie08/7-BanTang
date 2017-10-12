//
//  ChildViewController.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BaseViewController.h"

@interface ChildViewController : BaseViewController

@property (nonatomic, assign) NSInteger kindIndex;//标记种类(用来标记当前页面的顺序)


/**
 初始化ViewController
 
 @param kindIndex 标记种类
 @return return value description
 */
- (instancetype)initWithKindIndex:(NSInteger)kindIndex;

@end
