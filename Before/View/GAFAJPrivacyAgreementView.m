//
//  GAFAJPrivacyAgreementView.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFAJPrivacyAgreementView.h"
@interface GAFAJPrivacyAgreementView()
{
    UIView *dwekspabackView;
    UIButton *dwcancelButton;
    UIButton *dwtureButton;
}
@end
@implementation GAFAJPrivacyAgreementView
-(void)initView{
    
    dwekspabackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, WLScreen_height)];
    dwekspabackView.backgroundColor =[UIColor clearColor];
    dwekspabackView.userInteractionEnabled = YES ;
    [self addSubview:dwekspabackView];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(38, 59, WLScreen_width-76, WLScreen_height-59-58);
    
    view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    view.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:106/255.0 blue:163/255.0 alpha:0.28].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,3);
    view.layer.shadowRadius = 15;
    view.layer.shadowOpacity = 1;
    view.layer.cornerRadius = 10;
    view.userInteractionEnabled = YES;
    [self addSubview:view];
    
    UILabel * tekspaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 28, view.width, 30)];
    tekspaLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 22];
    tekspaLabel.textColor = [UIColor colorWithHexString:@"#000000"];
    tekspaLabel.textAlignment = NSTextAlignmentCenter;
    tekspaLabel.numberOfLines = 0 ;
    tekspaLabel.text = @"隐私协议";
    
    [view addSubview:tekspaLabel];
    
    
    
    
    
    
    UITextView * ekspatext = [[UITextView alloc]initWithFrame:CGRectMake(24, 71, view.width-48, view.height-71-139)];
    ekspatext.backgroundColor =[UIColor clearColor];
    ekspatext.alpha = 1;
    ekspatext.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    ekspatext.textColor = [UIColor colorWithHexString:@"#797979"];
    ekspatext.editable = NO;
    
    ekspatext.text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:NSLocalizedString(@"dingyueshouming", nil) ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
    
    [view addSubview:ekspatext];
    
    dwtureButton= [UIButton buttonWithType:UIButtonTypeCustom];
    dwtureButton.frame= CGRectMake((view.width-262)/2, view.height-60-50, 229, 50);
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,262,50);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:177/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:137/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [dwtureButton.layer insertSublayer:gl atIndex:0];
    
    dwtureButton.layer.cornerRadius = 10;
    
    [dwtureButton setTitleColor:[UIColor whiteColor]
                       forState:UIControlStateNormal];
    
    [dwtureButton setTitle:@"同意" forState:UIControlStateNormal];
    dwtureButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 18];
    [dwtureButton addTarget:self action:@selector(tureButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:dwtureButton];
    
    
    
    dwcancelButton= [UIButton buttonWithType:UIButtonTypeCustom];
    dwcancelButton.backgroundColor = [UIColor clearColor];
    [dwcancelButton setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.17]
                         forState:UIControlStateNormal];
    
    
    dwcancelButton.frame= CGRectMake((view.width-262)/2, view.height-50-5, 262, 50);
    
    [dwcancelButton setTitle:@"不同意" forState:UIControlStateNormal];
    
    [dwcancelButton addTarget:self action:@selector(cancelButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:dwcancelButton];
    
    
    
    
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initView];
    }
    return self;
}

-(void)cancelButtonclick:(UIButton *)button{
    
    
    self.cancelBlock(button);
    
    
}
-(void)tureButtonclick:(UIButton *)button{
    
    
    self.tureBlock(button);
    
    
}


@end
