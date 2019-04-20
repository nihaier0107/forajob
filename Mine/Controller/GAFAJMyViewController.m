//
//  GAFAJMyViewController.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "PerfectViewController.h"
#import "MySCTDViewController.h"
#import "GuanyuViewController.h"
#import "MineTableViewCell.h"
#import "DeliveryTableViewCell.h"
#import "GAFAJMyViewController.h"
#import "MineTableViewCell.h"
@interface GAFAJMyViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate,UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UITextField * nicheng;
    UILabel *nnllabel;
    UILabel *xllabel;
    UILabel *hylabel;
    UILabel *xzlabel;
    UIImageView * icon ;
}
@property (nonatomic) NSMutableArray * positiondataLasts;
@property (nonatomic) UITableView * tableView;
@end

@implementation GAFAJMyViewController
-(void)imageViewtap:(UITapGestureRecognizer *)tap{
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.editing = YES;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    //获取到的图片
    UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    icon.image = image;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    
    [textField resignFirstResponder];
    
    
    
    
    return YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    UIView *topview = [[UIView alloc] init];
    topview.frame = CGRectMake(0,0,WLScreen_width,130);
    topview .alpha = 1.0;
    topview.backgroundColor = [UIColor colorWithHexString:@"#0093FF"];
  
    [self.view addSubview:topview];
    self.positiondataLasts = [NSMutableArray arrayWithObjects:@"我的投递",@"我的收藏",@"关于我们", nil];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.alwaysBounceVertical = NO;
    
    self.tableView.bounces = NO;
    [self.tableView registerClass:[DeliveryTableViewCell class] forCellReuseIdentifier:@"Delivery"];
    [self.tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"Mine"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if(@available(iOS 11.0, *)) {            //方法一适配
                make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        }else{
            make.edges.equalTo(self.view);
            
        }
        
    }];
    [self.tableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.positiondataLasts.count;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row!=2) {
        
        static NSString * cellID = @"Delivery";
        DeliveryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[DeliveryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.mineLabel.text = self.positiondataLasts[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
        
        
    }else{
        
        static NSString * cellID = @"Mine";
        MineTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[MineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.mineLabel.text = self.positiondataLasts[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
    }
    
    
    
   
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row!=2) {
        return 46;
    }
    
    return 51;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0) {
        self.hidesBottomBarWhenPushed=YES;
        MySCTDViewController * vc = [[MySCTDViewController alloc]init];
        vc.type = @"我的投递";
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }else if (indexPath.row==1){
       self.hidesBottomBarWhenPushed=YES;
        MySCTDViewController * vc = [[MySCTDViewController alloc]init];
        vc.type = @"我的收藏";
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }else{
       self.hidesBottomBarWhenPushed=YES;
        GuanyuViewController * vc =[[GuanyuViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
         self.hidesBottomBarWhenPushed=NO;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 350;
}
-(void)boviewtap:(UITapGestureRecognizer *)tap{
    
    self.hidesBottomBarWhenPushed=YES;
    PerfectViewController * vc = [[PerfectViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed=NO;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, 350)];
    view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"] ;
    
    UIView *topview = [[UIView alloc] init];
    topview.frame = CGRectMake(0,0,WLScreen_width,130);
    topview .alpha = 1.0;
    topview.backgroundColor = [UIColor colorWithHexString:@"#0093FF"];
//    CAGradientLayer *gl = [CAGradientLayer layer];
//    gl.frame = CGRectMake(0,0,WLScreen_width,130);
//    gl.startPoint = CGPointMake(0, 0);
//    gl.endPoint = CGPointMake(1, 0);
//    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
//    gl.locations = @[@(0),@(1.0f)];
//    [topview.layer insertSublayer:gl atIndex:0];
    [view addSubview:topview];
    
    
    UILabel *gerenlabel = [[UILabel alloc] init];
    gerenlabel.frame = CGRectMake(0,17,WLScreen_width,26);
    gerenlabel.textAlignment = NSTextAlignmentCenter;
    gerenlabel.textColor = [UIColor whiteColor];
    gerenlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    gerenlabel.text = @"个人中心";
    gerenlabel.numberOfLines = 0;
    [topview addSubview:gerenlabel];
    
    UIView *miview = [[UIView alloc] init];
    miview.frame = CGRectMake(0,130,WLScreen_width,90);
    miview .alpha = 1.0;
    miview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [view addSubview:miview];
    view.userInteractionEnabled = YES;
    
    icon = [[UIImageView alloc]init];
    icon.frame = CGRectMake((WLScreen_width-90)/2, 85, 90, 90);
    icon.layer.cornerRadius = 45;
    icon.clipsToBounds = YES;
    icon.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewtap:)];
    [icon addGestureRecognizer:tap];
    [icon setImage:[UIImage imageNamed:@"touxiang"]];
    [view addSubview:icon];
    
    
    nicheng = [[UITextField alloc]init];
    nicheng.frame = CGRectMake(0, 184, WLScreen_width, 22);
    nicheng.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    nicheng.alpha = 0.8;
    nicheng.delegate = self;
    nicheng.textAlignment = NSTextAlignmentCenter;
    nicheng.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    
    [view addSubview:nicheng];
    
    
    UIView *boview = [[UIView alloc] init];
    boview.frame = CGRectMake(0,225,WLScreen_width,120);
    boview .alpha = 1.0;
    boview.userInteractionEnabled = YES;
     UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(boviewtap:)];
    [boview addGestureRecognizer:tap1];
    boview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [view addSubview:boview];
    
    
    UIImageView * conyImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"简历"]];
    conyImageView.frame = CGRectMake(9, 14, 14, 16);
    [boview addSubview:conyImageView];
    
    UILabel *conlabel = [[UILabel alloc]init];
    conlabel.frame = CGRectMake(34, 11, 88, 22);
    conlabel.textAlignment = NSTextAlignmentLeft;
    conlabel.text = @"我的简历";
    conlabel.textColor = [UIColor colorWithHexString:@"#000000"];
    conlabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    conlabel.alpha = 0.8;
    [boview addSubview:conlabel];
    UIView *viewlinetwo = [[UIView alloc] init];
    viewlinetwo.frame = CGRectMake(20.5,43.5,WLScreen_width-41,0.5);
    viewlinetwo.alpha = 0.15;
    viewlinetwo.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [boview addSubview:viewlinetwo];
    
    
    
    UILabel *agelabel = [[UILabel alloc] init];
    agelabel.frame = CGRectMake(20,53,40,22);
    agelabel.numberOfLines = 0;
    agelabel.textAlignment = NSTextAlignmentLeft;
    agelabel.text = @"年龄";
    agelabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    agelabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    agelabel.alpha = 0.4;
    [boview addSubview:agelabel];
    
     nnllabel= [[UILabel alloc] init];
    nnllabel.frame = CGRectMake(61,53,40,22);
    nnllabel.numberOfLines = 0;
    nnllabel.textAlignment = NSTextAlignmentLeft;
   
    nnllabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    nnllabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    nnllabel.alpha = 0.8;
    [boview addSubview:nnllabel];
    
    UILabel *edulabel = [[UILabel alloc] init];
    edulabel.frame = CGRectMake(20,85,40,22);
    edulabel.numberOfLines = 0;
    edulabel.textAlignment = NSTextAlignmentLeft;
    edulabel.text = @"学历";
    edulabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    edulabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    edulabel.alpha = 0.4;
    [boview addSubview:edulabel];
    
    
    
    xllabel = [[UILabel alloc] init];
    xllabel.frame = CGRectMake(61,85,WLScreen_width/2-61,22);
    xllabel.numberOfLines = 0;
    xllabel.textAlignment = NSTextAlignmentLeft;
    //xllabel.text = @"初中以上";
    xllabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    xllabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    xllabel.alpha = 0.8;
    [boview addSubview:xllabel];
    
    UILabel *qiwanglabel = [[UILabel alloc] init];
    qiwanglabel.frame = CGRectMake(WLScreen_width/2,53,70,22);
    qiwanglabel.numberOfLines = 0;
    qiwanglabel.textAlignment = NSTextAlignmentLeft;
    qiwanglabel.text = @"期望行业";
    qiwanglabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    qiwanglabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    qiwanglabel.alpha = 0.4;
    [boview addSubview:qiwanglabel];
    
    hylabel = [[UILabel alloc] init];
    hylabel.frame = CGRectMake(WLScreen_width/2+70,53,WLScreen_width/2-70,22);
    hylabel.numberOfLines = 0;
    hylabel.textAlignment = NSTextAlignmentLeft;
    //hylabel.text = @"服务行业";
    hylabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    hylabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    hylabel.alpha = 0.8;
    [boview addSubview:hylabel];
    
    UILabel *mondeylabel = [[UILabel alloc] init];
    mondeylabel.frame = CGRectMake(WLScreen_width/2,85,70,22);
    mondeylabel.numberOfLines = 0;
    mondeylabel.textAlignment = NSTextAlignmentLeft;
    mondeylabel.text = @"期望薪资";
    mondeylabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    mondeylabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    mondeylabel.alpha = 0.4;
    [boview addSubview:mondeylabel];
    
    xzlabel= [[UILabel alloc] init];
    xzlabel.frame = CGRectMake(WLScreen_width/2+70,85,WLScreen_width/2-70,22);
    xzlabel.numberOfLines = 0;
    xzlabel.textAlignment = NSTextAlignmentLeft;
  
    xzlabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    xzlabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    xzlabel.alpha = 0.8;
    [boview addSubview:xzlabel];
    return view;
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    NSString * nicheneeg=   [FAJUserDef objectForKey:@"nicheng"];
    if (nicheneeg.length>0) {
        nicheng.text = nicheneeg  ;
    }else{
        nicheng.text = @"找工作"  ;
        [FAJUserDef setObject:@"找工作"  forKey:@"nicheng"];
    }
    NSString * age =  [FAJUserDef objectForKey:@"age"];
    if (age.length>0) {
        nnllabel.text =age;
    }
    NSString * work=   [FAJUserDef objectForKey:@"work"];
    if (work.length>0) {
        xllabel.text = work  ;
    }
    NSString * profession=   [FAJUserDef objectForKey:@"profession"];
    if (profession.length>0) {
        hylabel.text = profession  ;
    }
    NSString * salary =  [FAJUserDef objectForKey:@"salary"];
    if (salary.length>0) {
        xzlabel.text =salary;
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //让键盘下去
    [nicheng resignFirstResponder];
   
    
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField.text.length>0) {
         [FAJUserDef setObject:textField.text forKey:@"nicheng"];
    }
    
    
    
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

@end
