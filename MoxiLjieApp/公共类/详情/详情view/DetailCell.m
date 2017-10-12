//
//  DetailCell.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DetailCell.h"

@interface DetailCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
//@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UIImageView *littlepicView;
@property (weak, nonatomic) IBOutlet UILabel *littletitleLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UIView *buyView;

@property (nonatomic, strong) HomePruduct *product;

@end

@implementation DetailCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview {
    static NSString *cellid = @"DetailCell";
    DetailCell *cell = [tableview dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DetailCell" owner:nil options:nil].firstObject;
    }
    cell.product = [[HomePruduct alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)setDataWithModel:(HomePruduct *)model {
    self.product = model;
    self.titleLab.text = model.title;
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"nopic"] options:SDWebImageAllowInvalidSSLCertificates];
    [self.littlepicView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"nopic"] options:SDWebImageAllowInvalidSSLCertificates];
    self.littletitleLab.text = model.title;
    self.priceLab.text = model.price;
//    self.picView.contentMode
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.buyView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoBuyVC)];
    [self.buyView addGestureRecognizer:tap];
}

- (void)gotoBuyVC {
    if ([self.delegate respondsToSelector:@selector(buyThingsToVCWithModel:)]) {
        [self.delegate buyThingsToVCWithModel:self.product];
    }
    NSLog(@"buybuybuy...");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
