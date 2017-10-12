//
//  BaseTabbarController.m
//  IOSFrame
//
//  Created by lijie on 2017/7/17.
//  Copyright © 2017年 lijie. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"

@interface BaseTabbarController ()

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].translucent = NO;
    
    HomeViewController *home = [[HomeViewController alloc] init];
    [self setChildVCWithViewController:home title:NSLocalizedString(@"首页", nil) image:[UIImage imageNamed:@"home_normal"]];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    [self setChildVCWithViewController:discover title:NSLocalizedString(@"发现", nil) image:[UIImage imageNamed:@"find"]];
}

- (void)setChildVCWithViewController:(UIViewController *)controller title:(NSString *)title image:(UIImage *)image {
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:controller];
    self.tabBar.tintColor = MyColor;

    nav.title = title;
    nav.tabBarItem.image = image;
    [self addChildViewController:nav];
}

@end
