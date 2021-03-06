//
//  DeliveryTableViewCell.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "DeliveryTableViewCell.h"

@implementation DeliveryTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.mineLabel = [[UILabel alloc]init];
    self.mineLabel.textAlignment = NSTextAlignmentLeft;
    self.mineLabel.frame = CGRectMake(20, 12, 80, 22);
    self.mineLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.mineLabel.textColor = [UIColor colorWithRed:96/255.0 green:96/255.0 blue:96/255.0 alpha:1.0];
    [self.contentView addSubview:self.mineLabel];
    
    self.mineImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的更多"]];
    self.mineImageView.frame = CGRectMake(WLScreen_width-27, 18, 7, 13);
    [self.contentView addSubview:self.mineImageView];
    UIView *viewline = [[UIView alloc] init];
    viewline.frame = CGRectMake(20.5,45.5,WLScreen_width-41,0.5);
    viewline.alpha = 0.19;
    viewline.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [self.contentView addSubview:viewline];
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
