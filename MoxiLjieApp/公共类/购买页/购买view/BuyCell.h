//
//  BuyCell.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyCell : UITableViewCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview;

- (void)setDataWithModel:(HomePruduct *)model;
//自适应高度
//1
//返回cell高度
+ (CGFloat)getCellHeightWithString:(NSString *)string;

@end
