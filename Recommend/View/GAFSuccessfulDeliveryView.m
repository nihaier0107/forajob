//
//  GAFSuccessfulDeliveryView.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFSuccessfulDeliveryView.h"

@implementation GAFSuccessfulDeliveryView
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
    self.backgroundColor = [UIColor clearColor];
    
    UIView *bgview = [[UIView alloc] init];
    bgview.frame = CGRectMake((WLScreen_width-200)/2,(WLScreen_height-150)/2,200,150);
    bgview.alpha = 0.75;
    bgview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    bgview.layer.cornerRadius = 10;
    bgview.clipsToBounds = YES;
    [self addSubview:bgview];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(50,47,100,57);
    label.numberOfLines = 0;
    label.text = @"投递成功请静候佳音";
    label.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor= [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [bgview addSubview:label];
    
    

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
