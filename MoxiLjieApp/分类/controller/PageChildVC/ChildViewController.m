//
//  ChildViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "ChildViewController.h"
#import "SliderNavBar.h"
#import "TypeViewModel.h"
#import "SliderNavBar.h"
#import "HomeCell.h"
#import "DetailViewController.h"

@interface ChildViewController ()<UITableViewDelegate, UITableViewDataSource, RefreshTableViewDelegate> {
//    SliderNavBar *_navbar;//类型滑动控件
}


@property (weak, nonatomic) IBOutlet JJRefreshTabView *childTable;

@property (nonatomic, strong) TypeViewModel *viewmodel;


@end

@implementation ChildViewController

/**
 初始化ViewController
 
 @param kindIndex 标记种类
 @return return value description
 */
- (instancetype)initWithKindIndex:(NSInteger)kindIndex {
    self = [super init];
    if (self) {
        _kindIndex = kindIndex;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark = data
- (void)initViewModelBinding {
    self.viewmodel = [[TypeViewModel alloc] init];
    [self loadDataIsRefresh:YES];
}

- (void)loadDataIsRefresh:(BOOL)isRefresh {
    @weakSelf(self);
    [self showWaiting];
    [self.viewmodel getTypeListWithRefresh:isRefresh type:self.kindIndex success:^(BOOL result) {
        [weakSelf hideWaiting];
        [weakSelf.childTable reloadData];
        if (weakSelf.viewmodel.typeList.count) {
            weakSelf.childTable.isShowMore = YES;
        }
        
    } failture:^(NSString *error) {
        [weakSelf hideWaiting];
        [weakSelf showMassage:error];
    }];
}

#pragma mark - refresh
//刷新
- (void)refreshTableViewHeader {
    [self loadDataIsRefresh:YES];
}
//加载
- (void)refreshTableViewFooter {
    [self loadDataIsRefresh:NO];
}


#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewmodel.typeList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260*Heigt_Scale;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [HomeCell myCellWithTableview:tableView];
    [cell setDataWithModel:self.viewmodel.typeList[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detail = [[DetailViewController alloc] init];
    Topic *model = self.viewmodel.typeList[indexPath.row];
    detail.thingId = model.newid;
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - UI
- (void)initUIView {
    [self setupTable];
}

- (void)setupTable {
    self.childTable.refreshDelegate = self;
    self.childTable.CanRefresh = YES;
    self.childTable.lastUpdateKey = NSStringFromClass([self class]);
    self.childTable.isShowMore = NO;
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
