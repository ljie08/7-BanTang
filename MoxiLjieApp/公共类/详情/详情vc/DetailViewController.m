//
//  DetailViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailCell.h"
#import "DetailHeaderCell.h"
#import "DetailViewModel.h"
#import "BuyViewController.h"

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource, BuyThingsDelegate>

@property (weak, nonatomic) IBOutlet JJRefreshTabView *detailTable;
@property (nonatomic, strong) DetailViewModel *viewmodel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - -data
- (void)initViewModelBinding {
    self.viewmodel = [[DetailViewModel alloc] init];
    [self loadData];
}

- (void)loadData {
//    @"167216"
    [self showWaiting];
    @weakSelf(self);
    [self.viewmodel getDetailListWithID:self.thingId success:^(BOOL result) {
        [weakSelf hideWaiting];
        [weakSelf.detailTable reloadData];
        
    } failture:^(NSString *error) {
        [weakSelf hideWaiting];
        [weakSelf showMassage:error];
    }];
}

#pragma mark - cell delegate
- (void)buyThingsToVCWithModel:(HomePruduct *)model {
    BuyViewController *buy = [[BuyViewController alloc] init];
    buy.home = model;
    [self.navigationController pushViewController:buy animated:YES];
}

#pragma mark - table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewmodel.detailList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    HomePruduct *model = self.viewmodel.detailList[indexPath.row];
//    CGFloat height = [DetailCell getCellHeightWithString:model.desc];
//    CGFloat height = [DetailCell boundingRectWithText:model.desc maxSize:CGSizeMake(Screen_Width-30, CGFLOAT_MAX) font:[UIFont systemFontOfSize:14]].height+398;
//    return height;
    return 388*Heigt_Scale;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = [DetailHeaderCell getCellHeightWithString:self.viewmodel.home.desc];
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailCell *cell = [DetailCell myCellWithTableview:tableView];
    cell.delegate = self;
    [cell setDataWithModel:self.viewmodel.detailList[indexPath.row]];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DetailHeaderCell *cell = [DetailHeaderCell myCellWithTableview:tableView];
    [cell setDataWithModel:self.viewmodel.home];
    return cell;
}


#pragma mark - UI
- (void)initUIView {
    self.navigationItem.title = NSLocalizedString(@"详情", nil);
    [self setBackButton:YES];
}





@end
