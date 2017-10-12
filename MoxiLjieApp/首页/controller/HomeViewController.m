//
//  HomeViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/11.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerScrollView.h"
#import "HomeViewModel.h"
#import "HomeCell.h"
#import "TypeViewController.h"
#import "DetailViewController.h"
#import "WKViewController.h"

@interface HomeViewController ()<BannerScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, RefreshTableViewDelegate>

@property (nonatomic, strong) BannerScrollView *bannerView;
@property (nonatomic, strong) UIImageView *bannerDefaultImg;//banner默认图片
@property (nonatomic, strong) HomeViewModel *viewmodel;
@property (weak, nonatomic) IBOutlet JJRefreshTabView *homeTable;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark = data
- (void)initViewModelBinding {
    self.viewmodel = [[HomeViewModel alloc] init];
    [self loadBanner];
    [self loadDataIsRefresh:YES];
}

- (void)loadDataIsRefresh:(BOOL)isRefresh {
    @weakSelf(self);
    [self showWaiting];
    [self.viewmodel getHomeListWithRefresh:isRefresh success:^(BOOL result) {
        [weakSelf hideWaiting];
        [weakSelf.homeTable reloadData];
        if (weakSelf.viewmodel.homeList.count >= 10) {
            weakSelf.homeTable.isShowMore = YES;
        }
        
    } failture:^(NSString *error) {
        [weakSelf hideWaiting];
        [weakSelf showMassage:error];
    }];
}

- (void)loadBanner {
    @weakSelf(self);
    [self showWaiting];
    [self.viewmodel getHomeBannerWithSuccess:^(BOOL result) {
        [weakSelf hideWaiting];
        [weakSelf setBannerData];
        
    } failture:^(NSString *error) {
        [weakSelf hideWaiting];
        [weakSelf showMassage:error];
    }];
}

- (void)loadDetailDataWithID:(NSString *)modelId {
    @weakSelf(self);
    [self.viewmodel getDetailListWithID:modelId success:^(BOOL result) {
        if ([weakSelf.viewmodel.home.type isEqualToString:@"2"]) {
            [weakSelf gotoWKWebViewWithUrl:weakSelf.viewmodel.home.share_url type:2];
        } else {
            [weakSelf gotoDetailVCWithID:modelId];
        }
        
    } failture:^(NSString *error) {
        [weakSelf showMassage:error];
    }];
}

#pragma mark - 跳转
- (void)gotoTypeVC {
    TypeViewController *type = [[TypeViewController alloc] init];
    type.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:type animated:YES];
}

- (void)gotoWKWebViewWithUrl:(NSString *)url type:(NSInteger)type {
    WKViewController *wkvc = [[WKViewController alloc] init];
    wkvc.url = url;
    wkvc.type = type;
    wkvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wkvc animated:YES];
}

- (void)gotoDetailVCWithID:(NSString *)modelId {
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.thingId = modelId;
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - refresh
//刷新
- (void)refreshTableViewHeader {
    [self loadDataIsRefresh:YES];
    [self loadBanner];
}
//加载
- (void)refreshTableViewFooter {
    [self loadDataIsRefresh:NO];
}

#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewmodel.homeList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [HomeCell myCellWithTableview:tableView];
    
    [cell setDataWithModel:self.viewmodel.homeList[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Topic *model = self.viewmodel.homeList[indexPath.row];
    [self loadDetailDataWithID:model.newid];
}

#pragma mark - BannerScrollViewDelegate
- (void)bannerTappedIndex:(NSInteger)index tap:(UITapGestureRecognizer *)tap {
    NSLog(@"%ld", index);
    NSString *url = self.viewmodel.bannerList[index];
    [self gotoWKWebViewWithUrl:url type:1];
}

#pragma mark - UI
- (void)initUIView {
    self.navigationItem.title = NSLocalizedString(@"首页", nil);
    [self setNav];
    [self setUpBannerView];
    [self setupTable];
}

- (void)setNav {
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showBtn.frame = CGRectMake(0, 0, 25, 25);
    [showBtn setImage:[UIImage imageNamed:@"type"] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(gotoTypeVC) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:showBtn];
    [self addNavigationWithTitle:nil leftItem:nil rightItem:leftItem titleView:nil];
}

- (void)setupTable {
    self.homeTable.refreshDelegate = self;
    self.homeTable.CanRefresh = YES;
    self.homeTable.lastUpdateKey = NSStringFromClass([self class]);
    self.homeTable.isShowMore = NO;
}

- (void)setUpBannerView {
    self.bannerView = [[BannerScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Width*180/375)];
    self.bannerView.bannerHeight = Screen_Width*180/375;
    self.bannerView.delegate = self;
    self.homeTable.tableHeaderView = self.bannerView;
    
    self.bannerDefaultImg = [[UIImageView alloc] init];
    self.bannerDefaultImg.frame = self.bannerView.bounds;
    self.bannerDefaultImg.image = [UIImage imageNamed:@"zhanwei"];
    self.bannerDefaultImg.contentMode = UIViewContentModeScaleAspectFill;
    self.bannerDefaultImg.clipsToBounds = YES;
    [self.bannerView addSubview:self.bannerDefaultImg];
}

- (void)setBannerData {
    if (self.viewmodel.bannerList.count > 0) {
        //把图片地址数组赋值给banner的地址数组
        self.bannerView.imageUrls = self.viewmodel.picList;
        if (self.bannerDefaultImg) {
            [self.bannerDefaultImg removeFromSuperview];
            self.bannerDefaultImg = nil;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
