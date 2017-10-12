//
//  DetailHeaderCell.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailHeaderCell : UITableViewCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview;
- (void)setDataWithModel:(HomeModel *)model;
//自适应高度
//返回cell高度
+ (CGFloat)getCellHeightWithString:(NSString *)string;

@end
