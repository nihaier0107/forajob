//
//  GAFAJRecordViewController.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFRecordBottomView.h"
#import "GAFAJRecordTypeViewController.h"
#import "GAFAJRecordDetailsViewController.h"
#import "FAJRecordDemoObject.h"
#import <WebKit/WebKit.h>
#import "FAJAdvertisingObject.h"
#import "WorkTableViewCell.h"
#import "GAFAJRecordViewController.h"
#import "GAFWebViewController.h"
@interface GAFAJRecordViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@property(nonatomic ,strong)NSTimer *timer;
@property (nonatomic) NSMutableArray * AdvertisingdataLasts;
@property (nonatomic) NSMutableArray * salarydataLasts;
@property (nonatomic) NSMutableArray * postdataLasts;
@property (nonatomic) NSMutableArray * positiondataLasts;
@property (nonatomic) UITableView * tableView;

@end

@implementation GAFAJRecordViewController
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:@"GAFAJRecordViewController"];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView:@"GAFAJRecordViewController"];
    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
     [FAJUserDef setObject:@"GAFAJRecordViewController" forKey:@"currentController"];
    UIView *topview = [[UIView alloc] init];
    topview.frame = CGRectMake(0,0,WLScreen_width,130);
    topview .alpha = 1.0;
    topview.backgroundColor = [UIColor colorWithHexString:@"#0093FF"];
    
    [self.view addSubview:topview];
    self.salarydataLasts = [NSMutableArray arrayWithObjects:@"普工",@"服务员",@"厨师",@"电工",@"缝纫/刺绣",@"货运司机",@"美甲师",@"销售员", nil];
    self.postdataLasts = [NSMutableArray arrayWithObjects:@"日本",@"新加坡",@"韩国",@"中国",@"新西兰",@"巴基斯坦",@"迪拜",@"中国香港", nil];
    self.AdvertisingdataLasts = [NSMutableArray array];
    self.positiondataLasts = [NSMutableArray array];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical = NO;
    
    self.tableView.bounces = NO;
    [self.tableView registerClass:[WorkTableViewCell class] forCellReuseIdentifier:@"Work"];
    [self.view addSubview:self.tableView];
    
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if(@available(iOS 11.0, *)) {            //方法一适配
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        
    }else{
        make.edges.equalTo(self.view);
            
        }
        
    }];
        
       
    [self createTableHeader];
    
}
- (void)createTableHeader {
    UIView * tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WLScreen_width, 468)];
    tableHeaderView.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    tableHeaderView.userInteractionEnabled = YES;
   
    UIView *headview = [[UIView alloc] init];
    headview.frame = CGRectMake(0,0,WLScreen_width,133);
    headview .alpha = 1.0;
    headview.backgroundColor =  [UIColor colorWithHexString:@"#0093FF"];
    headview.userInteractionEnabled = YES;
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,133);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [headview.layer insertSublayer:gl atIndex:0];
    [tableHeaderView addSubview:headview];
    UIView *miview = [[UIView alloc] init];
    miview.frame = CGRectMake(0,133,WLScreen_width,200);
    miview .alpha = 1.0;
    miview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [tableHeaderView addSubview:miview];
    
    UIView *boview = [[UIView alloc] init];
    boview.frame = CGRectMake(0,miview.bottom+5,WLScreen_width,125);
    boview .alpha = 1.0;
    boview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [tableHeaderView addSubview:boview];
    
    
    UILabel * title = [[UILabel alloc]init];
    title.frame = CGRectMake(0,17,WLScreen_width,26);
    title.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    title.text = @"出国工作";
    title.textAlignment = NSTextAlignmentCenter;
    title.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    title.numberOfLines = 0;
    [headview addSubview:title];
    
    
    
    
    
    AVQuery *versionQuery = [AVQuery queryWithClassName:@"Advertisement"];
    [versionQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count)
        {
            for (AVObject * object in objects) {
                
                FAJAdvertisingObject * model = [[FAJAdvertisingObject alloc]init];
                [model parseFromSeverDbData:object];
                [self.AdvertisingdataLasts addObject:model];
                
            }
            
            
           
           
        }
        if (self.AdvertisingdataLasts.count) {
            
            _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 63, WLScreen_width-40, 140)];
            _scrollView.layer.cornerRadius = 10;
            _scrollView.clipsToBounds = YES;
            _scrollView.backgroundColor = [UIColor whiteColor];
            [tableHeaderView addSubview:_scrollView];
            _scrollView.showsHorizontalScrollIndicator =NO;
            _scrollView.pagingEnabled = YES;
            _scrollView.delegate = self;
            _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((_scrollView.width-50)/2+20, 63+113, 50, 27)];
            _pageControl.backgroundColor=[UIColor clearColor];
            _pageControl.numberOfPages = self.AdvertisingdataLasts.count;
            _pageControl.currentPage = 0;
            CGFloat contentW =self.AdvertisingdataLasts.count *_scrollView.width;
            _scrollView.contentSize = CGSizeMake(contentW, 0);
            _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
            _pageControl.pageIndicatorTintColor =[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.27];
            
            [_pageControl addTarget:self action:@selector(changPage) forControlEvents:UIControlEventValueChanged];
            [tableHeaderView addSubview:_pageControl];
            
            for (int i=0; i<self.AdvertisingdataLasts.count; i++) {
                FAJAdvertisingObject * model =self.AdvertisingdataLasts[i];
                 UIImageView *imageView = [[UIImageView alloc] init];
                imageView.frame = CGRectMake(i*_scrollView.width, 0, _scrollView.width, _scrollView.height);
                imageView.clipsToBounds = YES;
                imageView.layer.cornerRadius = 10;
                [imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
                imageView.tag = 10+i;
                imageView.userInteractionEnabled = YES;
                UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewtap:)];
                [imageView addGestureRecognizer:tap];
                [_scrollView addSubview:imageView];
                
            }
            
            [self addTimer];
        }
          
        
    }];
    
    
    
    //热门岗位
    UIImageView * hotImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"岗位"]];
    hotImageView.frame = CGRectMake(11, 74+headview.bottom, 36, 42);
    [tableHeaderView addSubview:hotImageView];
    
    UILabel *hotlabel = [[UILabel alloc]init];
    hotlabel.frame = CGRectMake(47, 85+headview.bottom, 88, 22);
    hotlabel.textAlignment = NSTextAlignmentLeft;
    hotlabel.text = @"热门岗位";
    hotlabel.textColor = [UIColor colorWithHexString:@"#676767"];
    hotlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [tableHeaderView addSubview:hotlabel];
    
    UIView *viewlineone = [[UIView alloc] init];
    viewlineone.frame = CGRectMake(20.5,247.5,WLScreen_width-41,1);
    viewlineone.alpha = 0.15;
    viewlineone.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [tableHeaderView addSubview:viewlineone];
    
    for (int i =0; i<self.salarydataLasts.count; i++) {
        UIButton * button = [UIButton new];
        [button setTitle:self.salarydataLasts[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button setTitleColor:[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0] forState:UIControlStateNormal];
        button.tag = 100+i;
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        

        button.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
        [button addTarget:self action:@selector(salarydataLastsbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake((WLScreen_width-0)/4*(i%4), (i/4)*42.5+viewlineone.bottom, (WLScreen_width-0)/4, 42.5);
        [tableHeaderView addSubview:button];
        
    }
    
    //热门国家/地区
    UIImageView * conyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"国家地区"]];
    conyImageView.frame = CGRectMake(11, boview.top, 36, 42);
    [tableHeaderView addSubview:conyImageView];
    
    UILabel *conlabel = [[UILabel alloc]init];
    conlabel.frame = CGRectMake(47, boview.top+11, 120, 22);
    conlabel.textAlignment = NSTextAlignmentLeft;
    conlabel.text = @"热门国家/地区";
    conlabel.textColor = [UIColor colorWithHexString:@"#676767"];
    conlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [tableHeaderView addSubview:conlabel];
    
    UIView *viewlinetwo = [[UIView alloc] init];
    viewlinetwo.frame = CGRectMake(20.5,boview.top+40,WLScreen_width-41,1);
    viewlinetwo.alpha = 0.15;
    viewlinetwo.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [tableHeaderView addSubview:viewlinetwo];
    
    for (int i =0; i<self.postdataLasts.count; i++) {
        UIButton * button = [UIButton new];
        [button setTitle:self.postdataLasts[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button setTitleColor:[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0] forState:UIControlStateNormal];
        button.tag = 200+i;
        button.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [button addTarget:self action:@selector(salarydataLastsbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake((WLScreen_width-0)/4*(i%4), (i/4)*42.5+viewlinetwo.bottom, (WLScreen_width-0)/4, 42.5);
        [tableHeaderView addSubview:button];
        
    }
    self.tableView.tableHeaderView = tableHeaderView;
    
    
    
    
    AVQuery *wordQuery = [AVQuery queryWithClassName:@"viewChannelId2"];
    wordQuery.limit = 999;
    [wordQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        
        if (!error) {
            
            for (AVObject * object in objects) {
                if ([object[@"minSalary"] intValue]>12500) {
                    FAJRecordDemoObject * model = [[FAJRecordDemoObject alloc]init];
                    [model parseFromSeverDbData:object];
                    //model.object = object;
                    [self.positiondataLasts addObject:model];
                }
               
                
            }
            [self.tableView reloadData];
           
        }
        
        
        
    }];
    
}
-(void)salarydataLastsbuttonclick:(UIButton *)sender{
    
    self.hidesBottomBarWhenPushed=YES;
    GAFAJRecordTypeViewController * vc = [[GAFAJRecordTypeViewController alloc]init];
    if (sender.tag<200) {
        vc.type = 1;
    }else{
      vc.type = 2;
    }
    vc.typenameing = sender.titleLabel.text;
    [self.navigationController pushViewController:vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;
    
}
-(void)imageViewtap:(UITapGestureRecognizer*)tap{
    
   
    FAJAdvertisingObject * model = self.AdvertisingdataLasts[tap.view.tag-10];
    if (model.html&&model.html.length>0) {
        
         self.hidesBottomBarWhenPushed=YES;
        GAFWebViewController *webVC = [[GAFWebViewController alloc] init];
        webVC.webUrl = model.html;
        
        [self.navigationController pushViewController:webVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    
}
-(void)changPage
{
         CGPoint offest=CGPointMake(_pageControl.currentPage*_scrollView.frame.size.width, 0);
        [_scrollView setContentOffset:offest animated:YES];
     
 }

-(void)addTimer
{
          self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
        //提高优先级
       [[NSRunLoop currentRunLoop ] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)removeTimer
{
         [self.timer invalidate];
         self.timer =nil;
 }
-(void)nextImage
{
       //1.增加pageControl的页码
       int page = 0;
        if (_pageControl.currentPage ==self.AdvertisingdataLasts.count-1) {
         page = 0;
}
        else
           {
                page = _pageControl.currentPage +1;
           }
        //计算scrolview滚动的位置
       CGFloat offsetX = page *_scrollView.frame.size.width;
       CGPoint offset = CGPointMake(offsetX, 0);
        [_scrollView setContentOffset:offset animated:YES];

}
#pragma mark  --代理方法

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        //根据scrollview的滚动位置决定pageControl显示第几页
        CGFloat scrollW = _scrollView.frame.size.width;
  
        int page = (_scrollView.contentOffset.x+scrollW *0.5)/scrollW;
       _pageControl.currentPage =page;
}
- (void)didReceiveMemoryWarning
{
        [super didReceiveMemoryWarning];
       // Dispose of any resources that can be recreated.
 }

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
         // 停止定时器(一旦定时器停止了,就不能再使用)
        [self addTimer];
     }


 -(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
 {
         // 停止定时器(一旦定时器停止了,就不能再使用)
         [self removeTimer];
 }
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.positiondataLasts.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString * cellID = @"CELLID";
    WorkTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[WorkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    FAJRecordDemoObject * model =self.positiondataLasts[indexPath.row];
    cell.biaotilabel.text = model.name;
    cell.dizhilabel.text = model.workAddress;
    
    cell.jiagelabel.text =[NSString stringWithFormat:@"%ld-%ld",model.minSalary*12/10000,model.maxSalary*12/10000];
    NSString * sex ;
    if (model.gender==1) {
        sex = @"女";
    }else if (model.gender==2){
      sex = @"男";
    }else{
       sex = @"男女不限";
    }
    
    NSString * education ;
    if (model.education==2) {
        education = @"初中及以上";
    }else if (model.education==3){
        education = @"高中/中专及以上";
    }else if (model.education==4){
        education = @"大专及以上";
    }else if (model.education==5){
        education = @"本科及以上";
    }
    
    else{
        education = @"学历不限";
    }
    
    cell.yaoqiulabel.text = [NSString stringWithFormat:@"%@/%ld-%ld岁/%@",sex,(long)model.minAge,(long)model.maxAge,education];
    
    
    NSString *str =model.tagName;
    if ([str containsString:@"年终奖"]) {
        cell.jiagedanweilabeltwo.hidden = NO;
    }else{
        cell.jiagedanweilabeltwo.hidden = YES;
    }
    
    if (str.length>0) {
        
    
    NSArray * array = [str componentsSeparatedByString:@","];
    
    if (array.count>2) {
        cell.biaoqianlabelone.text =[NSString stringWithFormat:@" %@  ",array[0]];
        cell.biaoqianlabeltwo.text =[NSString stringWithFormat:@" %@  ",array[1]];
        cell.biaoqianlabelthree.text =[NSString stringWithFormat:@" %@  ",array[2]];
        
        
    }else if (array.count>1){
       
         cell.biaoqianlabelone.text =[NSString stringWithFormat:@" %@  ",array[0]];
         cell.biaoqianlabeltwo.text =[NSString stringWithFormat:@" %@  ",array[1]];
    }
    else if (array.count>0){
        
        cell.biaoqianlabelone.text =[NSString stringWithFormat:@" %@  ",array[0]];
    }
        
        
    }else{
        cell.jiagedanweilabeltwo.hidden = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.positiondataLasts.count) {
//        FAJRecordDemoObject * object = self.positiondataLasts[indexPath.row];
//        CGSize lblSize = [object.name boundingRectWithSize:CGSizeMake(WLScreen_width-42-70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size: 18]} context:nil].size;
//
//        if (lblSize.height>27) {
//
//            return 127;
//        }
//    }
    
    return 102;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.hidesBottomBarWhenPushed=YES;
    
    GAFAJRecordDetailsViewController * vc = [[GAFAJRecordDetailsViewController alloc]init];
    FAJRecordDemoObject * object = self.positiondataLasts[indexPath.row];
    vc.model =object;
    [self.navigationController pushViewController:vc animated:YES];
    
    self.hidesBottomBarWhenPushed=NO;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, 40)];
    view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0] ;
    //高薪推荐
    UIImageView * conyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"高薪"]];
    conyImageView.frame = CGRectMake(11, 1, 36, 42);
    [view addSubview:conyImageView];
    
    UILabel *conlabel = [[UILabel alloc]init];
    conlabel.frame = CGRectMake(47, 12, 88, 22);
    conlabel.textAlignment = NSTextAlignmentLeft;
    conlabel.text = @"高薪推荐";
    conlabel.textColor = [UIColor colorWithHexString:@"#676767"];
    conlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [view addSubview:conlabel];
    UIView *viewlinetwo = [[UIView alloc] init];
    viewlinetwo.frame = CGRectMake(20.5,39.5,WLScreen_width-41,0.5);
    viewlinetwo.alpha = 0.15;
    viewlinetwo.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [view addSubview:viewlinetwo];
    return view;
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //设置为白色
    return UIStatusBarStyleLightContent;
    //默认为黑色
    //return UIStatusBarStyleDefault;
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
