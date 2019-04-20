//
//  FirstScrollowViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FirstScrollowViewController.h"
#import "SecondScrollowViewViewController.h"
@interface FirstScrollowViewController ()<UIScrollViewDelegate>
{
    UIButton *skipButton;
    UIButton *dwtureButton;
    UIView *view ;
    UIView *selectedview ;
    UIScrollView * scrollView ;
    UIView *scroblueview ;
}
@property (nonatomic, strong) NSMutableArray * hotData;
@property (nonatomic, strong) NSMutableArray * totalData;
@property (nonatomic, assign) BOOL issKip;
@end

@implementation FirstScrollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *  currentController = [FAJUserDef objectForKey:@"currentController"];
    
    if (![currentController isEqualToString:@"GAFAJRecordViewController"]) {
        
        [FAJUserDef setObject:@"FirstScrollowViewController" forKey:@"currentController"];
    }
    // [FAJUserDef setObject:@"FirstScrollowViewController" forKey:@"currentController"];
    self.hotData = [NSMutableArray arrayWithObjects:@"马尔代夫",@"韩国",@"阿联酋/迪拜",@"阿根廷",@"阿曼",@"荷兰", nil];
    self.totalData = [NSMutableArray arrayWithObjects:@"环球航线",@"柬埔寨",@"日本",@"新西兰",@"新加坡",@"巴基斯坦",@"尼泊尔",@"尼日利亚",@"安哥拉",@"孟加拉",@"奥地利",@"太平洋航线",@"大阪",@"塞内加尔",@"埃及",@"国际航线",@"印尼",@"卡塔尔",@"中国香港",@"中国",@"东南亚航线",@"SINGAPORE",@"静冈",@"名古屋",@"中国香港",@"马尔代夫",@"韩国",@"阿联酋/迪拜",@"阿根廷",@"阿曼",@"荷兰", nil];
    UIView *viewbg = [[UIView alloc] init];
    viewbg.frame = CGRectMake(0,0,WLScreen_width,347);
    viewbg .alpha = 1.0;
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,347);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(0.9787065982818604, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [viewbg.layer insertSublayer:gl atIndex:0];
    [self.view addSubview:viewbg];
    
    
    view = [[UIView alloc] init];
    view.frame = CGRectMake(38, 59, WLScreen_width-76, WLScreen_height-59-58);
    
    view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    view.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:106/255.0 blue:163/255.0 alpha:0.28].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,3);
    view.layer.shadowRadius = 15;
    view.layer.shadowOpacity = 1;
    view.layer.cornerRadius = 10;
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    
    UILabel * labelone = [[UILabel alloc] init];
    labelone.frame = CGRectMake(0,38,view.width,58-25);
    labelone.numberOfLines = 0;
    labelone.textAlignment = NSTextAlignmentCenter;
    labelone.text = @"请选择";
    labelone.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 24];
    labelone.textColor = [UIColor colorWithHexString:@"#000000"];
    labelone.alpha = 0.8;
    [view addSubview:labelone];
    
    UILabel * labeltwo = [[UILabel alloc] init];
    labeltwo.frame = CGRectMake(0,38+33,view.width,25);
    labeltwo.numberOfLines = 0;
    labeltwo.textAlignment = NSTextAlignmentCenter;
    labeltwo.text = @"您期望的国家/地区";
    labeltwo.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    labeltwo.textColor = [UIColor colorWithHexString:@"#000000"];
    labeltwo.alpha = 0.8;
    [view addSubview:labeltwo];
    selectedview = [[UIView alloc]initWithFrame:CGRectMake(0, labeltwo.bottom+26, view.width, 33+37)];
    selectedview.userInteractionEnabled = YES;
    selectedview.backgroundColor = [UIColor whiteColor];
    [view addSubview:selectedview];
    
    
    UILabel *labelthree = [[UILabel alloc] init];
    labelthree.frame = CGRectMake(19,192,120,22);
    labelthree.numberOfLines = 0;
    labelthree.textAlignment = NSTextAlignmentLeft;
    labelthree.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    labelthree.text = @"热门国家/地区";
    labelthree.textColor = [UIColor colorWithHexString:@"#454545"];
    [view addSubview:labelthree];
   
    for (int i=0; i<self.hotData.count; i++) {
        
        UIButton * button = [UIButton new];
        button.frame = CGRectMake(19+(i%3)*(view.width-19-29-10)/3+(i%3)*5, 7+((i)/3)*38+labelthree.bottom, (view.width-19-29-10)/3, 33);
        button.layer.borderColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 16.5;
        button.clipsToBounds = YES;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:self.hotData[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
        [button setTitleColor:[UIColor colorWithHexString:@"#676767"] forState:UIControlStateNormal];
        button.tag= i+200;
        [button addTarget:self action:@selector(scrollViewbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:button];
    }
    
    UILabel *labelfour = [[UILabel alloc] init];
    labelfour.frame = CGRectMake(19,308,120,22);
    labelfour.numberOfLines = 0;
    labelfour.textAlignment = NSTextAlignmentLeft;
    labelfour.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    labelfour.text = @"全部国家/地区";
    labelfour.textColor = [UIColor colorWithHexString:@"#454545"];
    [view addSubview:labelfour];
    
    
    
    
    dwtureButton= [UIButton buttonWithType:UIButtonTypeCustom];
    dwtureButton.frame= CGRectMake((view.width-284)/2, view.height-47-19, 284, 47);
    CAGradientLayer *gl2 = [CAGradientLayer layer];
    gl2.frame = CGRectMake(0,0,284,47);
    gl2.startPoint = CGPointMake(0, 0);
    gl2.endPoint = CGPointMake(1, 0);
    gl2.cornerRadius = 10;
    gl2.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:177/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:137/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl2.locations = @[@(0),@(1.0f)];
    [dwtureButton.layer insertSublayer:gl2 atIndex:0];
    
    dwtureButton.layer.cornerRadius = 10;
    
    [dwtureButton setTitleColor:[UIColor whiteColor]
                       forState:UIControlStateNormal];
    
    [dwtureButton setTitle:@"确认" forState:UIControlStateNormal];
    dwtureButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [dwtureButton addTarget:self action:@selector(tureButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:dwtureButton];
    
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, labelfour.bottom, view.width, view.height-labelfour.bottom-47-19-20)];
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.directionalLockEnabled = YES ;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault ;
    scrollView.pagingEnabled = YES;
    
    scrollView.delegate = self ;
    scrollView.contentSize = CGSizeMake(0, self.totalData.count/3*38+(((self.totalData.count%3)==0)?0:1)*38+7);
    [view addSubview:scrollView];
    scroblueview= [[UIView alloc] init];
    scroblueview.frame = CGRectMake(selectedview.width-19-4,0,4,27);
    scroblueview.alpha = 0.54;
    scroblueview.backgroundColor = [UIColor colorWithRed:43/255.0 green:181/255.0 blue:255/255.0 alpha:1.0];
    scroblueview.layer.cornerRadius = 1.5;
    [scrollView addSubview:scroblueview];
    
    for (int i=0; i<self.totalData.count; i++) {

        UIButton * button = [UIButton new];
        button.frame = CGRectMake(19+(i%3)*(scrollView.width-19-29-10)/3+(i%3)*5, 7+((i)/3)*38, (scrollView.width-19-29-10)/3, 33);
        button.layer.borderColor = [UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 16.5;
        button.clipsToBounds = YES;
        button.backgroundColor = [UIColor clearColor];
        [button setTitle:self.totalData[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
        [button setTitleColor:[UIColor colorWithHexString:@"#676767"] forState:UIControlStateNormal];
        button.tag= i+300;
        [button addTarget:self action:@selector(scrollViewbuttonclick:) forControlEvents:UIControlEventTouchUpInside];

        [scrollView addSubview:button];
    }
    
    
    
    AVQuery *versionQuery = [AVQuery queryWithClassName:@"Look"];
    [versionQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count)
        {
            AVObject *object = objects[0];
            if ([@"1" isEqualToString:object[@"isSkip"]])
            {
                self.issKip = YES;
            }
            else
            {
                self.issKip = NO;
            }
        }
        else
        {
            self.issKip = YES;
        }
        
        if (self.issKip)
        {
            UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            lookButton.frame = CGRectMake(view.width-30-50, 35, 50, 22);
            [lookButton setTitle:@"跳过" forState:UIControlStateNormal];
            lookButton.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
            lookButton.alpha = 1;
            [lookButton setTitleColor:[UIColor colorWithHexString:@"#B9B9B9"] forState:UIControlStateNormal];
            [lookButton addTarget:self action:@selector(lookButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [view addSubview:lookButton];
        }
        
    }];
    
}
-(void)lookButtonClick{
    
    
    SecondScrollowViewViewController * vc =[[SecondScrollowViewViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}




-(void)createselectedbuttonview{
    
    
    [selectedview removeAllSubviews];
    
    NSArray * selectarray = [[FAJMyFavoriteDBManager sharedManager] queryAllDateDays];
    
    for (int i=0; i<selectarray.count; i++) {
        
        UIButton * button = [UIButton new];
        button.frame = CGRectMake(18+(i%3)*(selectedview.width-18-14-16)/3+(i%3)*8,0, (selectedview.width-18-14-16)/3, 33);
        button.layer.borderColor = [UIColor colorWithHexString:@"#2BB5FF"].CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 16.5;
        button.clipsToBounds = YES;
        button.backgroundColor = [UIColor clearColor];
        FAJMyFavoriteObject * objcet =selectarray[i];
        [button setTitle:objcet.objectId forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"按钮关闭"] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
        [button setTitleColor:[UIColor colorWithHexString:@"#2BB5FF"] forState:UIControlStateNormal];
        button.tag= i+100;
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.size.width, 0, button.imageView.size.width)];
        if (objcet.objectId.length<4) {
            
           [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width+10, 0, -button.titleLabel.bounds.size.width-10)];
        }else{
            
            [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width, 0, -button.titleLabel.bounds.size.width)];
        }
        
        
        [button addTarget:self action:@selector(scrollViewbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
        
        [selectedview addSubview:button];
    }
    
    
}
-(void)scrollViewbuttonclick:(UIButton *)sender{

    
        if ( [[FAJMyFavoriteDBManager sharedManager] queryAllDateDays].count<3) {
            
            if ([[FAJMyFavoriteDBManager sharedManager] isExistDateDays:sender.titleLabel.text]) {
                
                [[FAJMyFavoriteDBManager sharedManager]deleteLearnWordsWith:sender.titleLabel.text];
                
                
            }else{
                
                [[FAJMyFavoriteDBManager sharedManager]insertDateDaysWith:sender.titleLabel.text];
                
            }
        }else if ([[FAJMyFavoriteDBManager sharedManager] queryAllDateDays].count==3&&[[FAJMyFavoriteDBManager sharedManager] isExistDateDays:sender.titleLabel.text]){
            
            
            [[FAJMyFavoriteDBManager sharedManager]deleteLearnWordsWith:sender.titleLabel.text];
            
            
        }
        
        [self createselectedbuttonview];
        

    
   
    
}
-(void)tureButtonclick:(UIButton *)sender{
    
    if ([[FAJMyFavoriteDBManager sharedManager] queryAllDateDays].count>0) {
        
        SecondScrollowViewViewController * vc =[[SecondScrollowViewViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else{
        
        [MBProgressHUD showError:@"请选择国家/地区" toView:self.view];
        
    }
    
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    float zoom = 0;
    
    zoom= scrollView.contentOffset.y/(scrollView.contentSize.height -scrollView.frame.size.height+(scroblueview.frame.size.height-scroblueview.frame.size.height*scrollView.frame.size.height/scrollView.contentSize.height));
    
   
    
//    if (scrollView.contentOffset.y>27) {
    
        scroblueview.frame = CGRectMake(selectedview.width-19-4, zoom*scrollView.contentSize.height, 4, 27);
        
//    }else{
//
//      scroblueview.frame = CGRectMake(selectedview.width-19-4,0,4,27);
//    }
    
    NSLog(@"offset.y:%f",scrollView.contentOffset.y);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
