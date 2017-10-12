//
//  TypeViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "TypeViewController.h"
#import "ChildViewController.h"
#import "SliderNavBar.h"
#import "TypeViewModel.h"

@interface TypeViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource> {
    SliderNavBar *_navbar;//类型滑动控件
}

@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *pageArr;//子VC数组
@property (nonatomic, assign) NSInteger currentIndex;//当前页面index
@property (nonatomic, strong) TypeViewModel *viewmodel;

@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark = data
- (void)initViewModelBinding {
    self.viewmodel = [[TypeViewModel alloc] init];
    
}

#pragma mark - UIPageViewControllerDelegate & UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.pageArr indexOfObject:viewController];
    index --;
    if ((index < 0) || (index == NSNotFound)) {
        return nil;
    }
    return self.pageArr[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.pageArr indexOfObject:viewController];
    index ++;
    if (index >= self.pageArr.count) {
        return nil;
    }
    return self.pageArr[index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        ChildViewController *vc = pageViewController.viewControllers.firstObject;
        NSInteger index = [self.pageArr indexOfObject:vc];
        [_navbar moveToIndex:index];
        
        self.currentIndex = index;
    }
}


#pragma mark - UI
- (void)initUIView {
    self.navigationItem.title = NSLocalizedString(@"分类", nil);
    [self setBackButton:YES];
    [self setupSlider];
    [self initPage];
}

- (void)setupSlider {
    _navbar = [[SliderNavBar alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 44)];
    _navbar.buttonTitleArr = self.viewmodel.titleList;
    _navbar.mode = BottomLineModeEqualBtn;
    _navbar.fontSize = 14;
    _navbar.selectedColor = [UIColor redColor];
    _navbar.unSelectedColor = [UIColor grayColor];
    _navbar.bottomLineColor = [UIColor redColor];
    _navbar.canScrollOrTap = YES;
    [self.view addSubview:_navbar];
}

- (void)initPage {
    // 设置UIPageViewController的配置项
    NSDictionary *options = @{UIPageViewControllerOptionSpineLocationKey : @(UIPageViewControllerSpineLocationMin)};
    
    // 根据给定的属性实例化UIPageViewController
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    _pageArr = [NSMutableArray array];
    ChildViewController *contentVC = [[ChildViewController alloc] initWithKindIndex:0];
    ChildViewController *contentVC1 = [[ChildViewController alloc] initWithKindIndex:1];
    ChildViewController *contentVC2 = [[ChildViewController alloc] initWithKindIndex:2];
    ChildViewController *contentVC3 = [[ChildViewController alloc] initWithKindIndex:3];
    ChildViewController *contentVC4 = [[ChildViewController alloc] initWithKindIndex:4];
    ChildViewController *contentVC5 = [[ChildViewController alloc] initWithKindIndex:5];
    ChildViewController *contentVC6 = [[ChildViewController alloc] initWithKindIndex:6];
    [_pageArr addObjectsFromArray:@[contentVC, contentVC1, contentVC2, contentVC3, contentVC4, contentVC5, contentVC6]];
    
    [_pageViewController setViewControllers:[NSArray arrayWithObject:_pageArr[self.currentIndex]] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    _pageViewController.view.frame = CGRectMake(0, 44, Screen_Width, Screen_Height - 44);
    
    __weak typeof (_pageViewController)weakPageViewController = _pageViewController;
    __weak typeof (_pageArr)weakPageArr = _pageArr;
    @weakSelf(self);
    [_navbar setNavBarTapBlock:^(NSInteger index, UIPageViewControllerNavigationDirection direction) {
        [weakPageViewController setViewControllers:[NSArray arrayWithObject:weakPageArr[index]] direction:direction animated:YES completion:nil];
        weakSelf.currentIndex = index;
    }];
    
    // 在页面上，显示UIPageViewController对象的View
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_navbar moveToIndex:self.currentIndex];
}


@end
