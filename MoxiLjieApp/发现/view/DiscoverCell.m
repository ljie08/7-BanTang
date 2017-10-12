//
//  DiscoverCell.m
//  MoxiLjieApp
//
//  Created by ljie on 2017/9/13.
//  Copyright © 2017年 AppleFish. All rights reserved.
//

#import "DiscoverCell.h"

@interface DiscoverCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UILabel *zanLab;
@property (weak, nonatomic) IBOutlet UILabel *commentsLab;
@property (weak, nonatomic) IBOutlet UILabel *lookLab;

@end

@implementation DiscoverCell

+ (instancetype)myCellWithTableview:(UITableView *)tableview {
    static NSString *cellid = @"DiscoverCell";
    DiscoverCell *cell = [tableview dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"DiscoverCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)setDataWithModel:(Discover *)model {
    if (model.post) {
        DiscoverPost *post = model.post;
        
        [self.headerView sd_setImageWithURL:[NSURL URLWithString:post.user.avatar] placeholderImage:[UIImage imageNamed:@"me"] options:SDWebImageAllowInvalidSSLCertificates];
        self.nameLab.text = post.user.nickname;
        self.timeLab.text = post.datestr;
        
        [self.picView sd_setImageWithURL:[NSURL URLWithString:post.middle_pic_url] placeholderImage:nil options:SDWebImageAllowInvalidSSLCertificates];
        
//        self.picView.contentMode = UIViewContentModeScaleAspectFit;//imageview自适应图片大小
//        self.picView.clipsToBounds = YES;
        //让图片显示一部分
        UIImage *image = self.picView.image;
        CGImageRef imageRef =image.CGImage;
        CGImageRef imager = CGImageCreateWithImageInRect(imageRef,self.picView.frame);
        UIImage *newImage = [[UIImage alloc] initWithCGImage:imager];
        self.picView.image = newImage;
        
        self.descLab.text = post.content;
        self.zanLab.text = post.dynamic.praises.length?post.dynamic.praises:@"0";
        self.commentsLab.text = post.dynamic.comments.length?post.dynamic.comments:@"0";
        self.lookLab.text = post.dynamic.views.length?post.dynamic.views:@"0";
        
    }
    if (model.topic) {
        Topic *topic = model.topic;
        [self.headerView sd_setImageWithURL:[NSURL URLWithString:topic.user.avatar] placeholderImage:[UIImage imageNamed:@"me"] options:SDWebImageAllowInvalidSSLCertificates];
        self.nameLab.text = topic.user.nickname;
        self.timeLab.text = topic.datestr;
        
        [self.picView sd_setImageWithURL:[NSURL URLWithString:topic.share_pic] placeholderImage:[UIImage imageNamed:@"nopic"] options:SDWebImageAllowInvalidSSLCertificates];
//        self.picView.contentMode = UIViewContentModeScaleAspectFit;
        //让图片显示一部分
        UIImage *image = self.picView.image;
        CGImageRef imageRef =image.CGImage;
        CGImageRef imager = CGImageCreateWithImageInRect(imageRef,self.picView.frame);
        UIImage *newImage = [[UIImage alloc] initWithCGImage:imager];
        self.picView.image = newImage;
        
        self.descLab.text = topic.title;
        self.zanLab.text = topic.praises.length?topic.praises:@"0";
        self.commentsLab.text = topic.comments.length?topic.comments:@"0";
        self.lookLab.text = topic.views.length?topic.views:@"0";
    }
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
