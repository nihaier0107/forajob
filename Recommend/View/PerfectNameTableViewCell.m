//
//  PerfectNameTableViewCell.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "PerfectNameTableViewCell.h"

@implementation PerfectNameTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initsubviews];
    }
    return self;
}
-(void)initsubviews{
    
    self.contentView.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    

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
