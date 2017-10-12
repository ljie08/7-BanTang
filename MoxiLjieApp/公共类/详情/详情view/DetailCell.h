//
//  DetailCell.h
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BuyThingsDelegate <NSObject>

- (void)buyThingsToVCWithModel:(HomePruduct *)model;

@end

@interface DetailCell : UITableViewCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview;

@property (nonatomic, assign) id<BuyThingsDelegate> delegate;

- (void)setDataWithModel:(HomePruduct *)model;


@end
