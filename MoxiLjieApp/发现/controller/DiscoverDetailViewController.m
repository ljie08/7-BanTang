//
//  DiscoverDetailViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DiscoverDetailViewController.h"
#import "DisDetailViewModel.h"

@interface DiscoverDetailViewController ()

@property (nonatomic, strong) DisDetailViewModel *viewmodel;

@end

@implementation DiscoverDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)initViewModelBinding {
    self.viewmodel = [[DisDetailViewModel alloc] init];
    [self loadData];
}

- (void)loadData {
//    @"21408"
    [self.viewmodel getDetailListWithID:self.detailID success:^(BOOL result) {
        
    } failture:^(NSString *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
