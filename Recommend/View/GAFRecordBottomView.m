//
//  GAFRecordBottomView.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/9.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFRecordBottomView.h"

@implementation GAFRecordBottomView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
    }
    return self;
}
-(void)initView{
    self.userInteractionEnabled = YES;

    self.backgroundColor = [UIColor whiteColor];
    
    self.shoucangButton = [UIButton new];
    [self.shoucangButton setImage:[UIImage imageNamed:@"收藏未选中"] forState:UIControlStateNormal];
    [self.shoucangButton setImage:[UIImage imageNamed:@"收藏选中"] forState:UIControlStateSelected];
    [self.shoucangButton setTitle:@"收藏" forState:UIControlStateNormal];
    [self.shoucangButton setTitle:@"已收藏" forState:UIControlStateSelected];
    [self.shoucangButton setTitleColor:[UIColor colorWithRed:165/255.0 green:165/255.0 blue:165/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    self.shoucangButton.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    self.shoucangButton.frame = CGRectMake(0, 0, 125, 49);
    [self.shoucangButton addTarget:self action:@selector(shoucangButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.shoucangButton];
    self.toudiButton = [UIButton new];
    self.toudiButton.backgroundColor =  [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];
    [self.toudiButton setTitle:@"投递应聘" forState:UIControlStateNormal];
    [self.toudiButton setTitle:@"已投递应聘" forState:UIControlStateSelected];
    [self.toudiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    self.toudiButton.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    self.toudiButton.frame = CGRectMake(125, 0,WLScreen_width-125, 49);
    [self.toudiButton addTarget:self action:@selector(toudiButtonlick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.toudiButton];
    
}
-(void)shoucangButtonclick:(UIButton *)sender{
    
    //sender.selected = !sender.selected;
    self.shoucangBlock(sender);
    
}
-(void)toudiButtonlick:(UIButton *)sender{
    
    //sender.selected = !sender.selected;
    self.toudiBlock(sender);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
