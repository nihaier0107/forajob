//
//  GAFAJRecordDetailsViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/7.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFReportView.h"
#import "PerfectViewController.h"
#import "GAFAJLoginViewController.h"
#import "GAFRecordBottomView.h"
#import "GAFAJRecordDetailsViewController.h"
#import "GAFSuccessfulDeliveryView.h"
@interface GAFAJRecordDetailsViewController ()<UIScrollViewDelegate>
{
     UIScrollView * scrollView ;
    GAFRecordBottomView * bottomView;
    GAFReportView * view ;
}
@property (strong, nonatomic) UILabel * biaotilabel;
@property (strong, nonatomic) UILabel * jiagelabel;
@property (strong, nonatomic) UILabel * jiagedanweilabelone;
@property (strong, nonatomic) UILabel * jiagedanweilabeltwo;
@property (strong, nonatomic)UIImageView *dizhiImageView;
@property (strong, nonatomic) UILabel * dizhilabel;
@property (strong, nonatomic) UILabel * yaoqiulabel;
@property (strong, nonatomic) UILabel * biaoqianlabelone;
@property (strong, nonatomic) UILabel * biaoqianlabeltwo;
@property (strong, nonatomic) UILabel * biaoqianlabelthree;
@end

@implementation GAFAJRecordDetailsViewController
//- (void)viewWillAppear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = YES;
//}
//- (void)viewWillDisappear:(BOOL)animated{
//    self.tabBarController.tabBar.hidden = NO;
//}
-(void)jubaoclick{
     view= [[GAFReportView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, WLScreen_height)];
    view.cancelBlock = ^(UIButton * button) {
      
        [view removeFromSuperview];
    };
    view.commitBlock = ^(UIButton * button) {
      
        
        
        
        
        AVObject *JUBAOObject = [AVObject objectWithClassName:@"JuBaoZhiWei"];
        [JUBAOObject setObject:_model.objectid forKey:@"viewChannelId2"];
        
        [JUBAOObject saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded)
            {
                
                [MBProgressHUD showSuccess:@"举报成功" toView:self.view];
               
            }
            else
            {
                [MBProgressHUD showSuccess:@"举报失败" toView:self.view];
            }
            
             [view removeFromSuperview];
        }];
    };
    [self.view.window addSubview:view];
    
}
-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
    bottomView =nil;
    view = nil;
    _model = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,WLScreen_width ,WLScreen_height-59)];
    scrollView.backgroundColor =  [UIColor colorWithHexString:@"#F2F2F2"];
    scrollView.directionalLockEnabled = YES ;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault ;
    scrollView.pagingEnabled = YES;
    
    scrollView.delegate = self ;
    
    [self.view addSubview:scrollView];
    
    bottomView =[[GAFRecordBottomView alloc] initWithFrame:CGRectMake(0, scrollView.bottom+10, WLScreen_width, 49)];
    
    bottomView.shoucangBlock = ^(UIButton * sender) {
        if ([AVUser currentUser]) {
            
            AVQuery *guanzhuQuery = [AVQuery queryWithClassName:@"GuanZhuQuestion"];
            [guanzhuQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
            [guanzhuQuery whereKey:@"guanzhuObject" equalTo:_model.object];
            [guanzhuQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                if (objects.count)
                {
                    AVObject *guanzhuObject = objects[0];
                    [guanzhuObject deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                        if (succeeded)
                        {
                            
                            [MBProgressHUD showSuccess:@"取消收藏成功" toView:self.view];
                            sender.selected = NO;
                        }
                        else
                        {
                            [MBProgressHUD showSuccess:@"取消收藏失败" toView:self.view];
                        }
                    }];
                    
                }else{
                    
                    AVObject *guanzhuObject = [AVObject objectWithClassName:@"GuanZhuQuestion"];
                    
                    [guanzhuObject setObject:_model.object forKey:@"guanzhuObject"];
                    [guanzhuObject setObject:[AVUser currentUser] forKey:@"userObject"];
                    [guanzhuObject saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
                        if (succeeded)
                        {
                            
                            [MBProgressHUD showSuccess:@"收藏成功" toView:self.view];
                            sender.selected = YES;
                        }
                        else
                        {
                            [MBProgressHUD showSuccess:@"收藏失败" toView:self.view];
                        }
                    }];
                    
                }
            }];
            
            
        }else{
            [self.navigationController popViewControllerAnimated:NO];
            self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[GAFAJLoginViewController alloc] init]];
            
            
        }
        
    };
    bottomView.toudiBlock = ^(UIButton * sender) {
        if ([AVUser currentUser]) {
            if (!sender.selected) {
                if (![[FAJUserDef objectForKey:@"tianxieziliaook"] isEqualToString:@"1"]) {
                    //填写资料完全
                    self.hidesBottomBarWhenPushed=YES;
                    PerfectViewController * vc = [[PerfectViewController alloc]init];
                    [self.navigationController pushViewController:vc animated:YES];
                    
                    
                }
            }
            
            
            
            AVQuery *guanzhuQuery = [AVQuery queryWithClassName:@"TouDiQuestion"];
            [guanzhuQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
            [guanzhuQuery whereKey:@"guanzhuObject" equalTo:_model.object];
            [guanzhuQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
                if (objects.count)
                {
                    AVObject *guanzhuObject = objects[0];
                    [guanzhuObject deleteInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                        if (succeeded)
                        {
                            
                            [MBProgressHUD showSuccess:@"取消投递成功" toView:self.view];
                            sender.selected = NO;
                        }
                        else
                        {
                            [MBProgressHUD showSuccess:@"取消投递失败" toView:self.view];
                        }
                    }];
                    
                }else{
                    
                    AVObject *guanzhuObject = [AVObject objectWithClassName:@"TouDiQuestion"];
                     [guanzhuObject setObject:_model.object forKey:@"guanzhuObject"];
                    [guanzhuObject setObject:[AVUser currentUser] forKey:@"userObject"];
                    [guanzhuObject saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
                        if (succeeded)
                        {
                            
                            [MBProgressHUD showSuccess:@"投递成功" toView:self.view];
                            sender.selected = YES;
                        }
                        else
                        {
                            [MBProgressHUD showSuccess:@"投递失败" toView:self.view];
                        }
                    }];
                    
                }
            }];
            
            
        }else{
             [self.navigationController popViewControllerAnimated:NO];
            self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[GAFAJLoginViewController alloc] init]];
            
            
        }
        
    };
    
    if ([AVUser currentUser]) {
        
      
        AVQuery *guanzhuQuery = [AVQuery queryWithClassName:@"GuanZhuQuestion"];
        [guanzhuQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
        [guanzhuQuery whereKey:@"guanzhuObject" equalTo:_model.object];
        [guanzhuQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if (objects.count)
            {
                bottomView.shoucangButton.selected = YES;
            }else{
                
                bottomView.shoucangButton.selected = NO;;
            }
        }];
        
        AVQuery *toudiQuery = [AVQuery queryWithClassName:@"TouDiQuestion"];
        [toudiQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
        [toudiQuery whereKey:@"guanzhuObject" equalTo:_model.object];
        [toudiQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if (objects.count)
            {
                bottomView.toudiButton.selected = YES;
               
            }else{
               bottomView.toudiButton.selected = NO;
            }
        }];
        
        
    }
    [self.view addSubview:bottomView];
    
    UIView *headview = [[UIView alloc] init];
    headview.frame = CGRectMake(0,0,WLScreen_width,133);
    headview .alpha = 1.0;
    headview.userInteractionEnabled = YES;
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,133);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [headview.layer insertSublayer:gl atIndex:0];
    [scrollView addSubview:headview];
    
    
    UILabel * title = [[UILabel alloc]init];
    title.frame = CGRectMake(0,27,WLScreen_width,26);
    title.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    title.text = @"工作详情";
    title.textAlignment = NSTextAlignmentCenter;
    title.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    title.numberOfLines = 0;
   [scrollView addSubview:title];
    UIButton * back = [UIButton new];
    [back setImage:[UIImage imageNamed:@"详情返回"] forState:UIControlStateNormal];
    back.frame = CGRectMake(20, 31, 10, 18);
    [back addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:back];
    
    
    UIButton * jubao = [UIButton new];
    [jubao setImage:[UIImage imageNamed:@"举报"] forState:UIControlStateNormal];
    jubao.frame = CGRectMake(WLScreen_width-20-18, 31, 18, 18);
    [jubao addTarget:self action:@selector(jubaoclick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:jubao];
    
    
    
    
    
    
    CGSize lblSize = [_model.descript boundingRectWithSize:CGSizeMake(WLScreen_width-41, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size: 14]} context:nil].size;
    
    
    
    UIView *whiteviewone = [[UIView alloc] init];
    whiteviewone.frame = CGRectMake(0,133,WLScreen_width,lblSize.height+130);
    whiteviewone .alpha = 1.0;
    whiteviewone.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [scrollView addSubview:whiteviewone];
    
    UIImageView * gaoweiImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"岗位描述"]];
    gaoweiImageView.frame = CGRectMake(21, 87, 18, 18);
    [whiteviewone addSubview:gaoweiImageView];
    
    UILabel * gangweiLabel = [[UILabel alloc]init];
    gangweiLabel.text = @"岗位描述";
    gangweiLabel.textAlignment = NSTextAlignmentLeft;
    gangweiLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    gangweiLabel.frame = CGRectMake(48, 85, 85, 22);
    [whiteviewone addSubview:gangweiLabel];
    UIView *viewlineone = [[UIView alloc] init];
    viewlineone.frame = CGRectMake(20.5,115,WLScreen_width-41,1);
    viewlineone.alpha = 0.15;
    [whiteviewone addSubview:viewlineone];
    
    UILabel *miaoshulabelone = [[UILabel alloc] init];
    miaoshulabelone.frame = CGRectMake(20,121,WLScreen_width-40,lblSize.height);
    miaoshulabelone.numberOfLines = 0;
    miaoshulabelone.textAlignment = NSTextAlignmentLeft;
    miaoshulabelone.textColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
    miaoshulabelone.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    miaoshulabelone.text = _model.descript;
    [whiteviewone addSubview:miaoshulabelone];
    
    
    
    UIView *yaoqiuview = [[UIView alloc] init];
    yaoqiuview.frame = CGRectMake(20,63,WLScreen_width-40,140);
    yaoqiuview .alpha = 1.0;
    yaoqiuview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    yaoqiuview.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:137/255.0 blue:255/255.0 alpha:0.25].CGColor;
    yaoqiuview.layer.shadowOffset = CGSizeMake(0,0);
    yaoqiuview.layer.shadowRadius = 6;
    yaoqiuview.layer.shadowOpacity = 1;
    yaoqiuview.layer.cornerRadius = 10;
    [scrollView addSubview:yaoqiuview];
    
    self.biaotilabel = [[UILabel alloc]init];
    self.biaotilabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    self.biaotilabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    self.biaotilabel.textAlignment = NSTextAlignmentLeft;
    self.biaotilabel.numberOfLines = 2;
    self.biaotilabel.text = _model.name;
    self.biaotilabel.frame = CGRectMake(16, 0, yaoqiuview.width-61-20-16, 64);
    [yaoqiuview addSubview:self.biaotilabel];
    
    
    
    self.yaoqiulabel = [[UILabel alloc]init];
    self.yaoqiulabel.textColor = [UIColor colorWithHexString:@"#676767"];
    self.yaoqiulabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    self.yaoqiulabel.textAlignment = NSTextAlignmentLeft;
    self.yaoqiulabel.frame  = CGRectMake(16, 64, yaoqiuview.width-51-20-16, 20);
    
    
    
    NSString * sex ;
    if (_model.gender==1) {
        sex = @"女";
    }else if (_model.gender==2){
        sex = @"男";
    }else{
        sex = @"男女不限";
    }
    
    NSString * education ;
    if (_model.education==2) {
        education = @"初中及以上";
    }else if (_model.education==3){
        education = @"高中/中专及以上";
    }else if (_model.education==4){
        education = @"大专及以上";
    }else if (_model.education==5){
        education = @"本科及以上";
    }
    
    else{
        education = @"学历不限";
    }
    
    self.yaoqiulabel.text = [NSString stringWithFormat:@"%@/%ld-%ld岁/%@",sex,(long)_model.minAge,(long)_model.maxAge,education];
    [yaoqiuview addSubview:self.yaoqiulabel];
    
    
    NSString *str =_model.tagName;
    
    
    NSArray * array = [str componentsSeparatedByString:@","];
    
    
    
    self.biaoqianlabelone = [[UILabel alloc]init];
    self.biaoqianlabelone.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabelone.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabelone.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabelone.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabelone.clipsToBounds = YES;
    self.biaoqianlabelone.alpha = 0.62;
    self.biaoqianlabelone.layer.cornerRadius = 12.5 ;
    if (array.count>0) {
        
        CGSize lblSize = [array[0] boundingRectWithSize:CGSizeMake(WLScreen_width-41, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 12]} context:nil].size;
        
        self.biaoqianlabelone.text =array[0];
        self.biaoqianlabelone.frame = CGRectMake(16, 95, lblSize.width+10, 25);
    }
    
    [yaoqiuview addSubview:self.biaoqianlabelone];
    
    
    
    
    self.biaoqianlabeltwo = [[UILabel alloc]init];
    self.biaoqianlabeltwo.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabeltwo.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabeltwo.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabeltwo.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabeltwo.clipsToBounds = YES;
    self.biaoqianlabeltwo.alpha = 0.62;
    self.biaoqianlabeltwo.layer.cornerRadius = 12.5 ;
    if (array.count>1) {
        
        CGSize lblSize = [array[1] boundingRectWithSize:CGSizeMake(WLScreen_width-41, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 12]} context:nil].size;
        
        self.biaoqianlabeltwo.text =array[1];
        self.biaoqianlabeltwo.frame = CGRectMake(16+self.biaoqianlabelone.width+5, 95, lblSize.width+10, 25);
    }
    
    [yaoqiuview addSubview:self.biaoqianlabeltwo];
    
    
    
    
    self.biaoqianlabelthree = [[UILabel alloc]init];
    self.biaoqianlabelthree.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    self.biaoqianlabelthree.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.biaoqianlabelthree.textAlignment = NSTextAlignmentCenter;
    self.biaoqianlabelthree.backgroundColor = [UIColor colorWithHexString:@"#008BFF"];
    self.biaoqianlabelthree.clipsToBounds = YES;
    self.biaoqianlabelthree.alpha = 0.62;
    self.biaoqianlabelthree.layer.cornerRadius = 12.5 ;
    if (array.count>2) {
        
        CGSize lblSize = [array[2] boundingRectWithSize:CGSizeMake(WLScreen_width-41, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 12]} context:nil].size;
        
        self.biaoqianlabelthree.text =array[2];
        self.biaoqianlabelthree.frame = CGRectMake(16+self.biaoqianlabelone.width+5+self.biaoqianlabeltwo.width+5, 95, lblSize.width+10, 25);
    }
    [yaoqiuview addSubview:self.biaoqianlabelthree];
    
    
    
    
    
    self.jiagelabel = [[UILabel alloc]init];
    self.jiagelabel.textColor =[UIColor colorWithHexString:@"#FF0000"];
    self.jiagelabel.font =[UIFont fontWithName:@"PingFangSC-Semibold" size: 18];
    self.jiagelabel.textAlignment = NSTextAlignmentRight;
    self.jiagelabel.frame = CGRectMake(yaoqiuview.width-19-61, 13, 61, 23);
    self.jiagelabel.text =[NSString stringWithFormat:@"%ld-%ld",_model.minSalary*12/10000,_model.maxSalary*12/10000];
    [yaoqiuview addSubview:self.jiagelabel];
    
    
    
    self.jiagedanweilabelone = [[UILabel alloc]init];
    self.jiagedanweilabelone.textColor =[UIColor colorWithHexString:@"#676767"];
    self.jiagedanweilabelone.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.jiagedanweilabelone.textAlignment = NSTextAlignmentRight;
    self.jiagedanweilabelone.text = @"万/年";
    self.jiagedanweilabelone.frame = CGRectMake(yaoqiuview.width-19-61, self.jiagelabel.bottom, 51, 20);
    [yaoqiuview addSubview:self.jiagedanweilabelone];
    
    
    
    
    self.jiagedanweilabeltwo = [[UILabel alloc]init];
    self.jiagedanweilabeltwo.textColor =[UIColor colorWithHexString:@"#676767"];
    self.jiagedanweilabeltwo.text = @"年终奖";
    if ([str containsString:@"年终奖"]) {
        self.jiagedanweilabeltwo.hidden = NO;
    }else{
        self.jiagedanweilabeltwo.hidden = YES;
    }
    self.jiagedanweilabeltwo.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 12];
    self.jiagedanweilabeltwo.textAlignment = NSTextAlignmentRight;
    self.jiagedanweilabeltwo.frame = CGRectMake(yaoqiuview.width-19-61, self.jiagedanweilabelone.bottom, 51, 20);
    [yaoqiuview addSubview:self.jiagedanweilabeltwo];
    

    
    
    
    self.dizhilabel = [[UILabel alloc]init];
    self.dizhilabel.textColor =[UIColor colorWithHexString:@"#5FB6FF"];
    self.dizhilabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    self.dizhilabel.textAlignment = NSTextAlignmentRight;
    CGSize dizhilabelSize = [_model.workAddress boundingRectWithSize:CGSizeMake(WLScreen_width-41, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size: 18]} context:nil].size;
    
    self.dizhilabel.frame = CGRectMake(yaoqiuview.width-19-dizhilabelSize.width, 95, dizhilabelSize.width, 25);
    self.dizhilabel.text = _model.workAddress;
    [yaoqiuview addSubview:self.dizhilabel];
    
    
    
    self.dizhiImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"坐标"]];
    self.dizhiImageView.frame = CGRectMake(yaoqiuview.width-19-dizhilabelSize.width-16, 100, 10, 14);
    [yaoqiuview addSubview:self.dizhiImageView];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    UIView *whiteviewtwo = [[UIView alloc] init];
    whiteviewtwo.frame = CGRectMake(0,whiteviewone.bottom+5,WLScreen_width,150);
    whiteviewtwo .alpha = 1.0;
    whiteviewtwo.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [scrollView addSubview:whiteviewtwo];
    
    UIImageView * shijianImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"岗位描述"]];
    shijianImageView.frame = CGRectMake(21, 10, 19, 19);
    [whiteviewtwo addSubview:shijianImageView];
    
    UILabel * shijianLabel = [[UILabel alloc]init];
    shijianLabel.text = @"时间/签证";
    shijianLabel.textAlignment = NSTextAlignmentLeft;
    shijianLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    shijianLabel.frame = CGRectMake(48, 8, 85, 22);
    [whiteviewtwo addSubview:shijianLabel];
    UIView *viewlinetwo = [[UIView alloc] init];
    viewlinetwo.frame = CGRectMake(20.5,38,WLScreen_width-41,1);
    viewlinetwo.alpha = 0.15;
    [whiteviewtwo addSubview:viewlinetwo];
    
    UILabel *miaoshulabeltwo = [[UILabel alloc] init];
    miaoshulabeltwo.frame = CGRectMake(20,44,WLScreen_width-40,whiteviewtwo.height-44);
    miaoshulabeltwo.numberOfLines = 0;
    miaoshulabeltwo.textAlignment = NSTextAlignmentLeft;
    miaoshulabeltwo.textColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
    miaoshulabeltwo.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    
    miaoshulabeltwo.text = [NSString stringWithFormat:@"办理周期：%ld天-%ld天 \n签证类型:%@ \n合同期限:%ld个月",(long)_model.processCycle,(long)_model.processCycleHigh,_model.visaType[@"name"],(long)_model.contractYear];
    [whiteviewtwo addSubview:miaoshulabeltwo];
    
    
    UIView *whiteviewthree = [[UIView alloc] init];
    whiteviewthree.frame = CGRectMake(0,whiteviewtwo.bottom+5,WLScreen_width,150);
    whiteviewthree .alpha = 1.0;
    whiteviewthree.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [scrollView addSubview:whiteviewthree];
    
    UIImageView * qitaImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"岗位描述"]];
    qitaImageView.frame = CGRectMake(21, 10, 19, 19);
    [whiteviewthree addSubview:qitaImageView];
    
    UILabel * qitaLabel = [[UILabel alloc]init];
    qitaLabel.text = @"其他注意";
    qitaLabel.textAlignment = NSTextAlignmentLeft;
    qitaLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    qitaLabel.frame = CGRectMake(48, 8, 85, 22);
    [whiteviewthree addSubview:qitaLabel];
    UIView *viewlinethree = [[UIView alloc] init];
    viewlinethree.frame = CGRectMake(20.5,38,WLScreen_width-41,1);
    viewlinethree.alpha = 0.15;
    [whiteviewthree addSubview:viewlinethree];
    
    UILabel *miaoshulabelthree = [[UILabel alloc] init];
    miaoshulabelthree.frame = CGRectMake(20,44,WLScreen_width-40,whiteviewtwo.height-44);
    miaoshulabelthree.numberOfLines = 0;
    miaoshulabelthree.textAlignment = NSTextAlignmentLeft;
    miaoshulabelthree.textColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
    miaoshulabelthree.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    miaoshulabelthree.text = @"暂无";
    [whiteviewthree addSubview:miaoshulabelthree];
    scrollView.contentSize = CGSizeMake(0, 311+133+130+lblSize.height);
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc{
    
    
}
@end
