//
//  DicChildViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DicChildViewController.h"
#import "SliderNavBar.h"
#import "DiscoverViewModel.h"
#import "SliderNavBar.h"
#import "DiscoverCell.h"
#import "WKViewController.h"
#import "DiscoverDetailViewController.h"
#import "WebViewController.h"

@interface DicChildViewController ()<UITableViewDelegate, UITableViewDataSource, RefreshTableViewDelegate> {
    SliderNavBar *_navbar;//类型滑动控件
}

@property (nonatomic, strong) DiscoverViewModel *viewmodel;
@property (weak, nonatomic) IBOutlet JJRefreshTabView *childTable;

@end

@implementation DicChildViewController

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
    // Do any additional setup after loading the view from its nib.
}


#pragma mark = data
- (void)initViewModelBinding {
    self.viewmodel = [[DiscoverViewModel alloc] init];
    [self loadDataIsRefresh:YES];
}

- (void)loadDataIsRefresh:(BOOL)isRefresh {
    @weakSelf(self);
    [self showWaiting];
    if (self.kindIndex == 0) {
        [self.viewmodel getNewListWithRefresh:isRefresh success:^(BOOL result) {
            [weakSelf hideWaiting];
            [weakSelf.childTable reloadData];
            if (weakSelf.viewmodel.newlist.count >= 10) {
                weakSelf.childTable.isShowMore = YES;
            }
            
        } failture:^(NSString *error) {
            [weakSelf hideWaiting];
            [weakSelf showMassage:error];
        }];
    } else {
        [self.viewmodel getHotListWithRefresh:isRefresh success:^(BOOL result) {
            [weakSelf hideWaiting];
            [weakSelf.childTable reloadData];
            if (weakSelf.viewmodel.hotList.count >= 10) {
                weakSelf.childTable.isShowMore = YES;
            }
        } failture:^(NSString *error) {
            [weakSelf hideWaiting];
            [weakSelf showMassage:error];
        }];
    }
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
    if (self.kindIndex == 0) return self.viewmodel.newlist.count;
    return self.viewmodel.hotList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiscoverCell *cell = [DiscoverCell myCellWithTableview:tableView];
    if (self.kindIndex == 0) {
        [cell setDataWithModel:self.viewmodel.newlist[indexPath.row]];
    } else {
        [cell setDataWithModel:self.viewmodel.hotList[indexPath.row]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url;
    NSString *newId;
    Discover *model;
    if (self.kindIndex == 0) {
        model = self.viewmodel.newlist[indexPath.row];
    } else {
        model = self.viewmodel.hotList[indexPath.row];
    }
    if (model.topic) {
        url = model.topic.share_url;
        newId = model.topic.newid;
    } else {
        url = model.post.share_url;
        newId = model.post.newid;
    }
    
//    http://s.click.taobao.com/t?e=m%3D2%26s%3DCAR0MS3L0iVw4vFB6t2Z2ueEDrYVVa64XoO8tOebS%2BdRAdhuF14FMU64SHCUCtIFJ1gyddu7kN8SCaKErieudzDk0PPeYwvvyUPcP7QvvKoJYf%2Fg8IP1YmPJLBziAmVvWeJ9HtN6q5JVvIW9BvrxNcFYPL%2BbxJbgL%2BjF7ADwwNxzm%2BkCAbyYVXwD375mLwaTbiLmZe4oWFiS3EeZi8XH4A%3D%3D&unid=bantangapp
    
    
//    DiscoverDetailViewController *disvc = [[DiscoverDetailViewController alloc] init];
//    disvc.detailID = newId;
//    [self.navigationController pushViewController:disvc animated:YES];
    
//    WebViewController *web = [[WebViewController alloc] init];
//    web.myUrl = url;
//    web.type = 2;
//    web.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:web animated:YES];
    
    WKViewController *wkvc = [[WKViewController alloc] init];
    wkvc.url = url;
    wkvc.type = 2;
    wkvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wkvc animated:YES];
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


@end
