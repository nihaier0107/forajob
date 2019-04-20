//
//  GAFReportView.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFReportView.h"

@interface GAFReportView()
{
    UIView * boottomview;
   
}
@end
@implementation GAFReportView
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
    
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, WLScreen_height)];
    
    bgview.alpha = 0.44;
    bgview.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    bgview.userInteractionEnabled = YES;
    [self addSubview:bgview];
    
    
    boottomview = [[UIView alloc] init];
    boottomview.frame = CGRectMake(0,WLScreen_height-237,WLScreen_width,237);
    boottomview .alpha = 1.0;
    boottomview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    boottomview.userInteractionEnabled = YES;
    [self addSubview:boottomview];
    
    UILabel *jubaolabel = [[UILabel alloc] init];
    jubaolabel.frame = CGRectMake(0,16,WLScreen_width,22);
    jubaolabel.numberOfLines = 0;
    jubaolabel.textAlignment = NSTextAlignmentCenter;
    jubaolabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    jubaolabel.textColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
    jubaolabel.text = @"举报职位" ;
    [boottomview addSubview:jubaolabel];
    
    UIView *viewline = [[UIView alloc] init];
    viewline.frame = CGRectMake(20.5,54.5,WLScreen_width-41,0.5);
    viewline.alpha = 0.15;
    viewline.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    NSArray * array = [NSArray arrayWithObjects:@"虚假信息",@"涉嫌诈骗",@"其他问题", nil];
    [boottomview addSubview:viewline];
    for (int i=0; i<3; i++) {
        UIButton * button = [UIButton new];
        [button setTitleColor:[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0] forState:UIControlStateNormal];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.frame = CGRectMake(30+i*((WLScreen_width-60-44)/3+22), 65, (WLScreen_width-60-44)/3, 36);
        button.backgroundColor = [UIColor clearColor];
        button.layer.borderColor = [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1.0].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 18;
        button.clipsToBounds = YES;
        button.tag = 10+i;
        [button addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        [boottomview addSubview:button];
        
        
    }
    
    UIButton * tijiao = [UIButton new];
    tijiao.frame = CGRectMake((WLScreen_width-336)/2, 111, 336, 49);
    tijiao .alpha = 1.0;
    tijiao.backgroundColor = [UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];
    tijiao.layer.cornerRadius = 10;
    tijiao.clipsToBounds = YES;
    [tijiao setTitle:@"提交" forState:UIControlStateNormal];
    [tijiao setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    tijiao.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    
    [tijiao addTarget:self action:@selector(tijiaoclick:) forControlEvents:UIControlEventTouchUpInside];
    [boottomview addSubview:tijiao];
    
    UIButton * quxiao = [UIButton new];
    quxiao.frame = CGRectMake((WLScreen_width-336)/2, 170, 336, 49);
    quxiao .alpha = 1.0;
    quxiao.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    quxiao.layer.cornerRadius = 10;
    quxiao.clipsToBounds = YES;
    [quxiao setTitle:@"取消" forState:UIControlStateNormal];
    [quxiao setTitleColor:[UIColor colorWithHexString:@"#676767"] forState:UIControlStateNormal];
     quxiao.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    
    [quxiao addTarget:self action:@selector(quxiaoclick:) forControlEvents:UIControlEventTouchUpInside];
     [boottomview addSubview:quxiao];
    UIButton * guanbi = [UIButton new];
    [guanbi setImage:[UIImage imageNamed:@"举报关闭"] forState:UIControlStateNormal];
    [guanbi addTarget:self action:@selector(guanbiclick:) forControlEvents:UIControlEventTouchUpInside];
    guanbi.frame = CGRectMake(boottomview.width-20-13, 20, 13, 13);
    [boottomview addSubview:guanbi];
    
    
}
-(void)buttonclick:(UIButton *)sender{
    
    sender.selected = ! sender.selected;
    if (sender.selected) {
        [sender setTitleColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
        sender.backgroundColor =[UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];
    }else{
        sender.backgroundColor = [UIColor clearColor];
        [sender setTitleColor:[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    
}
-(void)tijiaoclick:(UIButton *)sender{
    BOOL iskeyitijiao = NO;
    for (int i=0; i<3; i++) {
        UIButton * button =  (UIButton *)[boottomview viewWithTag:10+i];
        if (button.selected) {
            iskeyitijiao=YES;
        }
    }
    
    if (iskeyitijiao) {
        
      self.commitBlock(sender);
        
    }else{
        
        [MBProgressHUD showSuccess:@"请选择举报信息" toView:self.superview];
    }
    
    
}
-(void)quxiaoclick:(UIButton *)sender{
    
    self.cancelBlock(sender);
}
-(void)guanbiclick:(UIButton *)sender{
    
    self.cancelBlock(sender);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
