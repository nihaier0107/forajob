//
//  WorkTableViewCell.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "WorkTableViewCell.h"
//@property (strong, nonatomic) UILabel * biaotilabel;
//@property (strong, nonatomic) UILabel * jiagelabel;
//@property (strong, nonatomic) UILabel * jiagedanweilabelone;
//@property (strong, nonatomic) UILabel * jiagedanweilabeltwo;
//@property (strong, nonatomic)UIImageView *dizhiImageView;
//@property (strong, nonatomic) UILabel * dizhilabel;
//@property (strong, nonatomic) UILabel * yaoqiulabel;
//@property (strong, nonatomic) UILabel * biaoqianlabelone;
//@property (strong, nonatomic) UILabel * biaoqianlabeltwo;
//@property (strong, nonatomic) UILabel * biaoqianlabelthree;
@implementation WorkTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaotilabel = [[UILabel alloc]init];
    self.biaotilabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    self.biaotilabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    self.biaotilabel.textAlignment = NSTextAlignmentLeft;
    self.biaotilabel.numberOfLines = 1;
    [self.contentView addSubview:self.biaotilabel];
    [self.biaotilabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(7);
        make.left.equalTo(self.contentView.mas_left).with.offset(21);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21-70);
        
    }];
    
    
    self.yaoqiulabel = [[UILabel alloc]init];
    self.yaoqiulabel.textColor = [UIColor colorWithHexString:@"#676767"];
    self.yaoqiulabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    self.yaoqiulabel.textAlignment = NSTextAlignmentLeft;
    
    [self.contentView addSubview:self.yaoqiulabel];
    
    [self.yaoqiulabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.biaotilabel.mas_bottom).with.offset(6);
        make.left.equalTo(self.contentView.mas_left).with.offset(21);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21-70);
        //make.height.mas_equalTo(@20);
    }];
    
    
    self.biaoqianlabelone = [[UILabel alloc]init];
    self.biaoqianlabelone.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabelone.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabelone.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabelone.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabelone.clipsToBounds = YES;
    self.biaoqianlabelone.alpha = 0.62;
    self.biaoqianlabelone.layer.cornerRadius = 12.5 ;
    [self.contentView addSubview:self.biaoqianlabelone];
    
    [self.biaoqianlabelone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yaoqiulabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.contentView.mas_left).with.offset(21);
        make.height.mas_equalTo(@25);
    }];
    
    
    self.biaoqianlabeltwo = [[UILabel alloc]init];
    self.biaoqianlabeltwo.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabeltwo.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabeltwo.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabeltwo.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabeltwo.clipsToBounds = YES;
    self.biaoqianlabeltwo.alpha = 0.62;
    self.biaoqianlabeltwo.layer.cornerRadius = 12.5 ;
    [self.contentView addSubview:self.biaoqianlabeltwo];
    
    [self.biaoqianlabeltwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yaoqiulabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.biaoqianlabelone.mas_right).with.offset(5);
        make.height.mas_equalTo(@25);
    }];
    
    
    self.biaoqianlabelthree = [[UILabel alloc]init];
    self.biaoqianlabelthree.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabelthree.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabelthree.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabelthree.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabelthree.clipsToBounds = YES;
    self.biaoqianlabelthree.alpha = 0.62;
    self.biaoqianlabelthree.layer.cornerRadius = 12.5 ;
    [self.contentView addSubview:self.biaoqianlabelthree];
    
    [self.biaoqianlabelthree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yaoqiulabel.mas_bottom).with.offset(8);
        make.left.equalTo(self.biaoqianlabeltwo.mas_right).with.offset(5);
        make.height.mas_equalTo(@25);
    }];
    
    
    
    self.jiagelabel = [[UILabel alloc]init];
    self.jiagelabel.textColor =[UIColor colorWithHexString:@"#FF0000"];
    self.jiagelabel.font =[UIFont fontWithName:@"PingFangSC-Semibold" size: 18];
    self.jiagelabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:self.jiagelabel];
    
    [self.jiagelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(8);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21);
        
    }];
    
    
    self.jiagedanweilabelone = [[UILabel alloc]init];
    self.jiagedanweilabelone.textColor =[UIColor colorWithHexString:@"#676767"];
    self.jiagedanweilabelone.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.jiagedanweilabelone.textAlignment = NSTextAlignmentRight;
    self.jiagedanweilabelone.text = @"万/年";
    [self.contentView addSubview:self.jiagedanweilabelone];
    
    [self.jiagedanweilabelone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.jiagelabel.mas_bottom).with.offset(1);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21);
        
    }];
    
    
    self.jiagedanweilabeltwo = [[UILabel alloc]init];
    self.jiagedanweilabeltwo.textColor =[UIColor colorWithHexString:@"#676767"];
    self.jiagedanweilabeltwo.text = @"年终奖";
    self.jiagedanweilabeltwo.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.jiagedanweilabeltwo.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:self.jiagedanweilabeltwo];
    
    [self.jiagedanweilabeltwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.jiagedanweilabelone.mas_bottom).with.offset(1);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21);
        
    }];
    
    
    self.dizhilabel = [[UILabel alloc]init];
    self.dizhilabel.textColor =[UIColor colorWithHexString:@"#5FB6FF"];
    self.dizhilabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    self.dizhilabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:self.dizhilabel];
    
    [self.dizhilabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(66);
        make.right.equalTo(self.contentView.mas_right).with.offset(-21);
        
    }];
    
    self.dizhiImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"坐标"]];
    [self.contentView addSubview:self.dizhiImageView];
    
    [self.dizhiImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(72);
        make.right.equalTo(self.dizhilabel.mas_left).with.offset(-5);
        make.width.mas_equalTo(@10);
        make.height.mas_equalTo(@14);
        
    }];
    
    UIView *viewline = [[UIView alloc] init];
    
    viewline.alpha = 0.15;
    viewline.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    
    [self.contentView addSubview:viewline];
    
    [viewline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
        make.left.equalTo(self.contentView.mas_left).with.offset(20);
        make.right.equalTo(self.contentView.mas_right).with.offset(-20);
       
        make.height.mas_equalTo(@0.5);
        
    }];
   
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
