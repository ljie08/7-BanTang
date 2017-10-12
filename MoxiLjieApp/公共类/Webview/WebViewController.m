//
//  WebViewController.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/15.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "WebViewController.h"
#import "IMYWebView.h"

@interface WebViewController ()<IMYWebViewDelegate>

@property (nonatomic, strong) IMYWebView *myWebview;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)initUIView {
    CGFloat y = 0.0;
    if (self.type == 1) {
        y = 0;
    } else if (self.type == 2) {
        y = -60;
    }
    
    
    self.myWebview = [[IMYWebView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-y) usingUIWebView:YES];
    self.myWebview.delegate = self;
    [self.myWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.myUrl]]];
    [self.view addSubview:self.myWebview];
}

- (BOOL)webView:(IMYWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *requestString = [[[request URL] absoluteString] stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    //    NSLog(@"request = %@",requestString);
    if ([requestString rangeOfString:@"baidu.com"].location != NSNotFound) {//去除广告
        return NO;
    }
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSLog(@"可点击");
        
        //收藏  bookmark://21979
        if ([requestString rangeOfString:@"bookmark://"].location != NSNotFound ) {
            NSString *str;
            //            if (![self.manager isExistModel:self.model]) {
            //                [self.manager insertRemindData:self.model];
            //                str = @"document.getElementById('bookmark').innerHTML = '已收藏';";
            //
            //            }else{
            ////                [self.manager removeRelationShipOfRemindContent:self.model];
            //                str = @"document.getElementById('bookmark').innerHTML = '收藏';";
            //
            //            }
            
            [webView evaluateJavaScript:str completionHandler:^(id obj, NSError *error) {
                if (error) {
                    NSLog(@"error = %@",error.description);
                }
            }];
        }
        
    }
    return YES;
}
@end
