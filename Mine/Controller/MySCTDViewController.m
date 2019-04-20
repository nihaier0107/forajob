//
//  MySCTDViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/11.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFAJRecordDetailsViewController.h"
#import "WorkTableViewCell.h"
#import "GAFAJWorkViewController.h"
#import "FAJRecordDemoObject.h"
#import "GAFAJRecordTypeViewController.h"
#import "MySCTDViewController.h"

@interface MySCTDViewController ()
<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    UILabel * nolabe;
}
@property (nonatomic) NSMutableArray * viewChannelId2iddata;
@property (nonatomic) NSMutableArray * positiondataLasts;
@property (nonatomic) UITableView * tableView;
@end

@implementation MySCTDViewController

-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    nolabe = [[UILabel alloc]init];
    nolabe.frame = CGRectMake(0, WLScreen_height/2-30, WLScreen_width, 30);
    if ([_type isEqualToString:@"我的收藏"]) {
      nolabe.text = @"您还没有收藏";
    }else{
       nolabe.text = @"您还没有投递";
    }
    nolabe.alpha = 0.3;
    nolabe.textColor =[UIColor blackColor];
    nolabe.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    nolabe.hidden = YES;
    nolabe.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:nolabe];
    
    
    
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    
    self.positiondataLasts = [NSMutableArray array];
    self.viewChannelId2iddata = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[WorkTableViewCell class] forCellReuseIdentifier:@"Work"];
    [self.view addSubview:self.tableView];
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
    label.text =_type;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor =[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    label.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    [view addSubview:label];
    
    UIButton * back = [UIButton new];
    [back setImage:[UIImage imageNamed:@"详情返回"] forState:UIControlStateNormal];
    back.frame = CGRectMake(20, 31, 10, 18);
    [back addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:back];
    
   
    if ([_type isEqualToString:@"我的收藏"]) {
        
        
        AVQuery *guanzhuQuery = [AVQuery queryWithClassName:@"GuanZhuQuestion"];
        [guanzhuQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
        [guanzhuQuery includeKey:@"guanzhuObject"];
        [guanzhuQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if (objects.count)
            {
                
                for (int i=0; i<objects.count; i++) {
                    
                    FAJRecordDemoObject * model = [[FAJRecordDemoObject alloc]init];
                    [model parseFromSeverDbData:objects[i][@"guanzhuObject"]];
                    [self.positiondataLasts addObject:model];
                }
                [self.tableView reloadData];
               
            }else{
                nolabe.hidden = NO;
                self.tableView.hidden = YES;
            }
                
         
         }];
    }else {
       
        
        AVQuery *guanzhuQuery = [AVQuery queryWithClassName:@"TouDiQuestion"];
        [guanzhuQuery whereKey:@"userObject" equalTo:[AVUser currentUser]];
        [guanzhuQuery includeKey:@"guanzhuObject"];
        [guanzhuQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
            if (objects.count)
            {
                for (int i=0; i<objects.count; i++) {
                    
                    FAJRecordDemoObject * model = [[FAJRecordDemoObject alloc]init];
                    [model parseFromSeverDbData:objects[i][@"guanzhuObject"]];
                    [self.positiondataLasts addObject:model];
                }
                [self.tableView reloadData];
                
            }else{
                nolabe.hidden = NO;
                self.tableView.hidden = YES;
            }
            
            
        }];
        
        
    }
    
   
    
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
    
    self.hidesBottomBarWhenPushed=NO;
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
