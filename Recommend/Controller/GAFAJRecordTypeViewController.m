//
//  GAFAJRecordTypeViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/9.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFAJRecordDetailsViewController.h"
#import "WorkTableViewCell.h"
#import "GAFAJWorkViewController.h"
#import "FAJRecordDemoObject.h"
#import "GAFAJRecordTypeViewController.h"

@interface GAFAJRecordTypeViewController ()
<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (nonatomic) NSMutableArray * positiondataLasts;
@property (nonatomic) UITableView * tableView;
@end

@implementation GAFAJRecordTypeViewController
-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    
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
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,0,WLScreen_width,63);
    view .alpha = 1.0;
    view.userInteractionEnabled = YES;
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,63);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [view.layer insertSublayer:gl atIndex:0];
    [self.view addSubview:view];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,27,WLScreen_width,26);
    label.numberOfLines = 0;
    label.text =_typenameing;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor =[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    label.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    [view addSubview:label];
    
    UIButton * back = [UIButton new];
    [back setImage:[UIImage imageNamed:@"详情返回"] forState:UIControlStateNormal];
    back.frame = CGRectMake(20, 31, 10, 18);
    [back addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:back];
    
    AVQuery * wordQuery = [AVQuery queryWithClassName:@"viewChannelId2"];
    wordQuery.limit = 999;
    [wordQuery orderByDescending:@"createdAt"];
    if (_type==1) {
        [wordQuery whereKey:@"postName" containsString:_typenameing];
    }else {
        [wordQuery whereKey:@"workAddress" containsString:_typenameing];
    }
    
    [wordQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        
        
        if (!error) {
            for (AVObject * object in objects) {
                FAJRecordDemoObject * model = [[FAJRecordDemoObject alloc]init];
                [model parseFromSeverDbData:object];
                [self.positiondataLasts addObject:model];
                
            }
            [self.tableView reloadData];
            
        }
        
        
        
    }];
    
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
    if (str.length>0) {
        
        if ([str containsString:@"年终奖"]) {
            cell.jiagedanweilabeltwo.hidden = NO;
        }else{
            cell.jiagedanweilabeltwo.hidden = YES;
        }
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
    
    // self.hidesBottomBarWhenPushed=NO;
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
