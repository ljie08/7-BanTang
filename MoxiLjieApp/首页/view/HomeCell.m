//
//  HomeCell.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell ()

@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *authorLab;
@property (weak, nonatomic) IBOutlet UILabel *viewLab;
@property (weak, nonatomic) IBOutlet UILabel *likeLab;

@end

@implementation HomeCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview {
    static NSString *cellid = @"HomeCell";
    HomeCell *cell = [tableview dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)setDataWithModel:(Topic *)model {
    [self.picView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@"zhanwei"] options:SDWebImageAllowInvalidSSLCertificates];
    self.titleLab.text = model.title;
    self.authorLab.text = model.user.nickname;
    self.viewLab.text = model.views;
    self.likeLab.text = model.likes;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
