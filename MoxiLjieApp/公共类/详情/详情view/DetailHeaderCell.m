//
//  DetailHeaderCell.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DetailHeaderCell.h"

@interface DetailHeaderCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *lookLab;
@property (weak, nonatomic) IBOutlet UILabel *descLab;

@end

@implementation DetailHeaderCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview {
    static NSString *cellid = @"DetailHeaderCell";
    DetailHeaderCell *cell = [tableview dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DetailHeaderCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)setDataWithModel:(HomeModel *)model {
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:model.user.avatar] placeholderImage:[UIImage imageNamed:@"me"] options:SDWebImageAllowInvalidSSLCertificates];
    self.nameLab.text = model.user.nickname;
    self.descLab.text = model.desc;
    self.lookLab.text = model.likes;
    
}

//自适应高度
//返回cell高度
+ (CGFloat)getCellHeightWithString:(NSString *)string {
    return [LJUtil initWithSize:CGSizeMake(Screen_Width - 30, CGFLOAT_MAX) string:string font:14].height + 45 + 10;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
