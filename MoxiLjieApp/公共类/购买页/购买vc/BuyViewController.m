//
//  BuyViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyCell.h"
#import "BannerScrollView.h"
#import "WKViewController.h"

@interface BuyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *buyTable;
@property (nonatomic, strong) BannerScrollView *bannerView;
@property (nonatomic, strong) UIImageView *bannerDefaultImg;//banner默认图片

@end

@implementation BuyViewController

- (instancetype)init {
    if (self = [super init]) {
        _home = [[HomePruduct alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)buyFromTaoBao:(id)sender {
    WKViewController *wkvc = [[WKViewController alloc] init];
    wkvc.url = self.home.url;
    wkvc.type = 1;
    wkvc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:wkvc animated:YES];
}

- (void)setBannerData {
    NSMutableArray *urlArr = [NSMutableArray array];
    for (Picture *pic in self.home.pics) {
        [urlArr addObject:pic.url];
    }
    if (self.home.pics.count > 0) {
        //把图片地址数组赋值给banner的地址数组
        self.bannerView.imageUrls = urlArr;
        if (self.bannerDefaultImg) {
            [self.bannerDefaultImg removeFromSuperview];
            self.bannerDefaultImg = nil;
        }
    }
}

#pragma mark - table

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [BuyCell getCellHeightWithString:self.home.desc];
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BuyCell *cell = [BuyCell myCellWithTableview:tableView];
    
    [cell setDataWithModel:self.home];
    
    return cell;
}

#pragma mark - UI
- (void)initUIView {
    self.navigationItem.title = NSLocalizedString(@"购买详情", nil);
    [self setBackButton:YES];
    
    [self setUpBannerView];
}

- (void)setUpBannerView {
    self.bannerView = [[BannerScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Width)];
    self.bannerView.bannerHeight = Screen_Width;
    self.buyTable.tableHeaderView = self.bannerView;
    
    self.bannerDefaultImg = [[UIImageView alloc] init];
    self.bannerDefaultImg.frame = self.bannerView.bounds;
    self.bannerDefaultImg.image = [UIImage imageNamed:@"zhanwei"];
    self.bannerDefaultImg.contentMode = UIViewContentModeScaleAspectFill;
    self.bannerDefaultImg.clipsToBounds = YES;
    [self.bannerView addSubview:self.bannerDefaultImg];
    
    [self setBannerData];
}

@end
