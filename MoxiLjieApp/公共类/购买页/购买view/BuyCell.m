//
//  BuyCell.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/14.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "BuyCell.h"

@interface BuyCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *likeLab;
@property (weak, nonatomic) IBOutlet UILabel *descLab;

@end

@implementation BuyCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview {
    static NSString *cellid = @"BuyCell";
    BuyCell *cell = [tableview dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"BuyCell" owner:nil options:nil].firstObject;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)setDataWithModel:(HomePruduct *)model {
    self.titleLab.text = model.title;
    self.likeLab.text = [NSString stringWithFormat:@"%@人喜欢", model.likes];
    self.descLab.text = model.desc;
    
    [self setLabelSpace:self.descLab string:self.descLab.text font:[UIFont systemFontOfSize:14]];
}

//设置label行间距
- (void)setLabelSpace:(UILabel *)label string:(NSString *)str font:(UIFont *)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentJustified;
    
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

//自适应高度
//1
//返回cell高度
+ (CGFloat)getCellHeightWithString:(NSString *)string {
    return [LJUtil initWithSize:CGSizeMake(Screen_Width - 30, CGFLOAT_MAX) string:string font:14].height + 12 + 87;
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
