//
//  PerfectViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "SelectedDataPerfectView.h"
#import "PerfectViewController.h"
#import "GAFAJLoginViewController.h"
@interface PerfectViewController ()<UITextFieldDelegate,UITextViewDelegate>
{
    NSInteger _whichone;
}
@property(nonatomic,strong)UILabel * name;
@property(nonatomic,strong)UILabel * sex;
@property(nonatomic,strong)UILabel *age;
@property(nonatomic,strong)UILabel *education;
@property(nonatomic,strong)UILabel *profession;
@property(nonatomic,strong)UILabel * post;
@property(nonatomic,strong)UILabel * couty;
@property(nonatomic,strong)UILabel * mondey;
@property(nonatomic,strong)UILabel *person ;
@property(nonatomic,strong)UILabel * showsex;//gender
@property(nonatomic,strong)UILabel *showage;
@property(nonatomic,strong)UILabel *showeducation;
@property(nonatomic,strong)UILabel *showprofession;
@property(nonatomic,strong)UILabel * showpost;
@property(nonatomic,strong)UILabel * showcouty;
@property(nonatomic,strong)UILabel * showmondey;
@property(nonatomic,strong)UITextView *showperson ;
@property(nonatomic,strong)UITextField *nameField;
@end

@implementation PerfectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    UIView *navview = [[UIView alloc] init];
    navview.frame = CGRectMake(0,0,WLScreen_width,64);
    navview .alpha = 1.0;
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,64);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [navview.layer insertSublayer:gl atIndex:0];
    [self.view addSubview:navview];
    UIButton * button = [UIButton new];
    [button setImage:[UIImage imageNamed:@"关于我们返回"] forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 31, 10, 18);
    [button addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UILabel *guanyulabel = [[UILabel alloc] init];
    guanyulabel.frame = CGRectMake(0,27,WLScreen_width,26);
    guanyulabel.text = @"请完善资料";
    guanyulabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    guanyulabel.textAlignment = NSTextAlignmentCenter;
    guanyulabel.textColor = [UIColor whiteColor];
    guanyulabel.numberOfLines = 0;
    [self.view addSubview:guanyulabel];
    
    UILabel *tishilabel = [[UILabel alloc] init];
    tishilabel.frame = CGRectMake(20,navview.bottom+6,WLScreen_width-40,20);
    tishilabel.numberOfLines = 0;
    tishilabel.text=@"提示：为提高通过机会，请尽可能如实填写";
    tishilabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 14];
    tishilabel.textAlignment = NSTextAlignmentLeft;
    tishilabel.textColor =[UIColor colorWithRed:103/255.0 green:103/255.0 blue:103/255.0 alpha:1.0];
    [self.view addSubview:tishilabel];
    
    self.name = [[UILabel alloc]init];
    self.name.textAlignment = NSTextAlignmentLeft;
    self.name.frame = CGRectMake(20, 47+navview.bottom, 40, 22);
    self.name.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.name.textColor = [UIColor colorWithHexString:@"#000000"];
    self.name.alpha = 0.4;
    self.name.text = @"姓名";
    [self.view addSubview:self.name];
    
    self.nameField = [[UITextField alloc]initWithFrame:CGRectMake(104, 48+navview.bottom, 100, 22)];
    self.nameField.placeholder = @"";
    self.nameField.textColor = [UIColor blackColor];
    self.nameField.alpha = 0.8;
    self.nameField.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    self.nameField.textAlignment = NSTextAlignmentLeft;
    self.nameField.delegate = self;
    self.nameField.tag =1;
    if ([AVUser currentUser]) {
        NSString * sex =[AVUser currentUser][@"nicheng"];
        if (sex.length>0) {
            
            
            self.nameField.text = sex;
            
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"nicheng"];
            if (work.length>0) {
                self.nameField.text =work  ;
            }
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"nicheng"];
        if (work.length>0) {
            self.nameField.text =work  ;
        }
    }
    [self.view addSubview:self.nameField];
    
    
    
    
    
    self.sex = [[UILabel alloc]init];
    self.sex.textAlignment = NSTextAlignmentLeft;
    self.sex.frame = CGRectMake(20, 99+navview.bottom, 40, 22);
    self.sex.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.sex.textColor = [UIColor colorWithHexString:@"#000000"];
    self.sex.alpha = 0.4;
    self.sex.text = @"性别";
    [self.view addSubview:self.sex];
    
    
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap5 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    UITapGestureRecognizer * tap7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    self.showsex = [[UILabel alloc]init];
    self.showsex.textAlignment = NSTextAlignmentLeft;
    self.showsex.frame = CGRectMake(104, 99+navview.bottom, 40, 22);
    self.showsex.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showsex.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showsex.alpha = 0.8;
    self.showsex.userInteractionEnabled = YES;
    self.showsex.tag = 1;
    [self.showsex addGestureRecognizer:tap1];
    
    if ([AVUser currentUser]) {
        NSString * sex =[AVUser currentUser][@"gender"];
        if (sex.length>0) {
            
           
                self.showsex.text = sex;
           
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"sex"];
            if (work.length>0) {
                self.showsex.text =work  ;
            }
        }
      
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"sex"];
        if (work.length>0) {
            self.showsex.text =work  ;
        }
    }
    
    [self.view addSubview:self.showsex];
    
    self.age = [[UILabel alloc]init];
    self.age.textAlignment = NSTextAlignmentLeft;
    self.age.frame = CGRectMake(20, 150+navview.bottom, 40, 22);
    self.age.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.age.textColor = [UIColor colorWithHexString:@"#000000"];
    self.age.alpha = 0.4;
    self.age.text = @"年龄";
    [self.view addSubview:self.age];
    
    
    self.showage = [[UILabel alloc]init];
    self.showage.textAlignment = NSTextAlignmentLeft;
    self.showage.frame = CGRectMake(104, 150+navview.bottom, 40, 22);
    self.showage.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showage.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showage.alpha = 0.8;
    self.showage.tag = 2;
    self.showage.userInteractionEnabled = YES;
    [self.showage addGestureRecognizer:tap2];
    if ([AVUser currentUser]) {
        NSString * age =[AVUser currentUser][@"age"];
        if (age.length>0) {
            
            self.showage.text = age;
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"age"];
            if (work.length>0) {
                self.showage.text =work  ;
            }
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"age"];
        if (work.length>0) {
            self.showage.text =work  ;
        }
    }
    [self.view addSubview:self.showage];
    
    self.education = [[UILabel alloc]init];
    self.education.textAlignment = NSTextAlignmentLeft;
    self.education.frame = CGRectMake(20, 200+navview.bottom, 40, 22);
    self.education.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.education.textColor = [UIColor colorWithHexString:@"#000000"];
    self.education.alpha = 0.4;
    self.education.text = @"学历";
    [self.view addSubview:self.education];
    
    
    self.showeducation = [[UILabel alloc]init];
    self.showeducation.textAlignment = NSTextAlignmentLeft;
    self.showeducation.frame = CGRectMake(104, 200+navview.bottom, 200, 22);
    self.showeducation.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showeducation.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showeducation.alpha = 0.8;
    self.showeducation.tag = 3;
    self.showeducation.userInteractionEnabled = YES;
   [self.showeducation addGestureRecognizer:tap3];
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"education"] ;
        if (edu.length>0) {
            
            self.showeducation.text = edu;
            
        }else{
            NSString * work=   [FAJUserDef objectForKey:@"work"];
            if (work.length>0) {
                 self.showeducation.text =work  ;
            }
           
            //默认是
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"work"];
        if (work.length>0) {
            self.showeducation.text =work  ;
        }
        //默认是
    }
    [self.view addSubview:self.showeducation];
    
    
    self.profession = [[UILabel alloc]init];
    self.profession.textAlignment = NSTextAlignmentLeft;
    self.profession.frame = CGRectMake(20, 252+navview.bottom, 70, 22);
    self.profession.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.profession.textColor = [UIColor colorWithHexString:@"#000000"];
    self.profession.alpha = 0.4;
    self.profession.text = @"期望行业";
    [self.view addSubview:self.profession];
    
    
    self.showprofession = [[UILabel alloc]init];
    self.showprofession.textAlignment = NSTextAlignmentLeft;
    self.showprofession.frame = CGRectMake(104, 252+navview.bottom, 200, 22);
    self.showprofession.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showprofession.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showprofession.alpha = 0.8;
    self.showprofession.tag = 4;
    self.showprofession.userInteractionEnabled = YES;
   [self.showprofession addGestureRecognizer:tap4];
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"profession"] ;
        if (edu.length>0) {
            
            self.showprofession.text = edu;
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"profession"];
            if (work.length>0) {
                self.showprofession.text =work  ;
            }
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"profession"];
        if (work.length>0) {
            self.showprofession.text =work  ;
        }
    }
    [self.view addSubview:self.showprofession];
    
    self.post = [[UILabel alloc]init];
    self.post.textAlignment = NSTextAlignmentLeft;
    self.post.frame = CGRectMake(20, 303+navview.bottom, 70, 22);
    self.post.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.post.textColor = [UIColor colorWithHexString:@"#000000"];
    self.post.alpha = 0.4;
    self.post.text = @"期望岗位";
    [self.view addSubview:self.post];
    
    
    self.showpost = [[UILabel alloc]init];
    self.showpost.textAlignment = NSTextAlignmentLeft;
    self.showpost.frame = CGRectMake(104, 303+navview.bottom, 200, 22);
    self.showpost.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showpost.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showpost.alpha = 0.8;
    self.showpost.tag = 5;
    self.showpost.userInteractionEnabled = YES;
    [self.showpost addGestureRecognizer:tap5];
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"post"] ;
        if (edu.length>0) {
            
            self.showpost.text = edu;
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"post"];
            if (work.length>0) {
                self.showpost.text =work  ;
            }
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"post"];
        if (work.length>0) {
            self.showpost.text =work  ;
        }
    }
    [self.view addSubview:self.showpost];
    
    self.couty = [[UILabel alloc]init];
    self.couty.textAlignment = NSTextAlignmentLeft;
    self.couty.frame = CGRectMake(20, 353+navview.bottom, 70, 22);
    self.couty.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.couty.textColor = [UIColor colorWithHexString:@"#000000"];
    self.couty.alpha = 0.4;
    self.couty.text = @"期望国家";
    [self.view addSubview:self.couty];
    
    self.showcouty = [[UILabel alloc]init];
    self.showcouty.textAlignment = NSTextAlignmentLeft;
    self.showcouty.frame = CGRectMake(104, 353+navview.bottom, 100, 22);
    self.showcouty.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showcouty.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showcouty.alpha = 0.8;
    self.showcouty.tag = 6;
    self.showcouty.userInteractionEnabled = YES;
   [self.showcouty addGestureRecognizer:tap6];
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"couty"] ;
        if (edu.length>0) {
            
            self.showcouty.text = edu;
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"couty"];
            if (work.length>0) {
                self.showcouty.text =work  ;
            }
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"couty"];
        if (work.length>0) {
            self.showcouty.text =work  ;
        }
    }
    [self.view addSubview:self.showcouty];
    
    self.mondey = [[UILabel alloc]init];
    self.mondey.textAlignment = NSTextAlignmentLeft;
    self.mondey.frame = CGRectMake(20, 405+navview.bottom, 70, 22);
    self.mondey.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.mondey.textColor = [UIColor colorWithHexString:@"#000000"];
    self.mondey.alpha = 0.4;
    self.mondey.text = @"期望薪资";
    [self.view addSubview:self.mondey];
    
    self.showmondey = [[UILabel alloc]init];
    self.showmondey.textAlignment = NSTextAlignmentLeft;
    self.showmondey.frame = CGRectMake(104, 405+navview.bottom, 170, 22);
    self.showmondey.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showmondey.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showmondey.alpha = 0.8;
    self.showmondey.tag = 7;
     self.showmondey.userInteractionEnabled = YES;
    [self.showmondey addGestureRecognizer:tap7];
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"mondey"] ;
        if (edu.length>0) {
            
            self.showmondey.text = edu;
            
        }else{
            NSString * work=   [FAJUserDef objectForKey:@"salary"];
            if (work.length>0) {
                self.showmondey.text =work  ;
            }
            
            //默认是
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"salary"];
        if (work.length>0) {
            self.showmondey.text =work  ;
        }
       
        //默认是
    }
    [self.view addSubview:self.showmondey];
    
    self.person = [[UILabel alloc]init];
    self.person.textAlignment = NSTextAlignmentLeft;
    self.person.frame = CGRectMake(20, 456+navview.bottom, 70, 22);
    self.person.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.person.textColor = [UIColor colorWithHexString:@"#000000"];
    self.person.alpha = 0.4;
    self.person.text = @"个人简介";
    [self.view addSubview:self.person];
    
    self.showperson = [[UITextView alloc]initWithFrame:CGRectMake(104, 456+navview.bottom, 200, 22+47)];
    self.showperson.textAlignment = NSTextAlignmentLeft;
    
    self.showperson.tag= 2;
    self.showperson.delegate = self;
    self.showperson.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    self.showperson.textColor = [UIColor colorWithHexString:@"#000000"];
    self.showperson.alpha = 0.8;
    if ([AVUser currentUser]) {
        NSString * edu =[AVUser currentUser][@"person"] ;
        if (edu.length>0) {
            
            self.showperson.text = edu;
            
        }else{
            
            NSString * work=   [FAJUserDef objectForKey:@"person"];
            if (work.length>0) {
                self.showperson.text =work  ;
            }
            //默认是
        }
        
    }else{
        NSString * work=   [FAJUserDef objectForKey:@"person"];
        if (work.length>0) {
            self.showperson.text =work  ;
        }
        //默认是
    }
    [self.view addSubview:self.showperson];
    for (int i=0; i<8; i++) {
            UIView * lineone = [[UIView alloc]init];
            lineone.frame = CGRectMake(0, 85+i*51+navview.bottom, WLScreen_width, 0.5);
            lineone.alpha = 0.15;
            lineone.backgroundColor = [UIColor colorWithHexString:@"#707070"];
            [self.view addSubview:lineone];
    }
    

    UIButton * comm = [UIButton new];
    comm.frame = CGRectMake(20, WLScreen_height-69, WLScreen_width-40, 49);
    comm.backgroundColor =[UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0];
    comm.layer.cornerRadius = 10;
    comm.clipsToBounds = YES;
    [comm setTitle:@"提交" forState:UIControlStateNormal];
    [comm addTarget:self action:@selector(commclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:comm];
    
    // Do any additional setup after loading the view.
}
-(void)tap:(UITapGestureRecognizer *)tap{
    _whichone =tap.view.tag;
    SelectedDataPerfectView * view = [[SelectedDataPerfectView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, WLScreen_height) WithpoptipsType:tap.view.tag];
    view.guanbiBlock = ^(UIButton * button) {
        [view removeFromSuperview];
    };
    view.saveBlock = ^(UIButton * button) {
       
        if (_whichone==1) {
            NSString * work =  [FAJUserDef objectForKey:@"sex"];
            if (work.length>0) {
                self.showsex.text =work;
            }
           
        }else if (_whichone==2){
            NSString * work =  [FAJUserDef objectForKey:@"age"];
            if (work.length>0) {
                self.showage.text =work;
            }
        }else if (_whichone==3){
            NSString * work =  [FAJUserDef objectForKey:@"work"];
            if (work.length>0) {
                self.showeducation.text =work;
            }
        }else if (_whichone==4){
            NSString * work =  [FAJUserDef objectForKey:@"profession"];
            if (work.length>0) {
                self.showprofession.text =work;
            }
        }else if (_whichone==5){
            NSString * work =  [FAJUserDef objectForKey:@"post"];
            if (work.length>0) {
                self.showpost.text =work;
            }
        }else if (_whichone==6){
            NSString * work =  [FAJUserDef objectForKey:@"couty"];
            if (work.length>0) {
                self.showcouty.text =work;
            }
        }else if (_whichone==7){
            NSString * work =  [FAJUserDef objectForKey:@"salary"];
            if (work.length>0) {
                self.showmondey.text =work;
            }
        }
        
        [view removeFromSuperview];
        
    };
    [self.view addSubview:view];
}
-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)commclick:(UIButton *)button{
    
    BOOL isquanbu = NO;
    if ([AVUser currentUser]) {
        NSString * nicheng =  [FAJUserDef objectForKey:@"nicheng"];
        if (nicheng.length>0) {
            [[AVUser currentUser] setObject:nicheng forKey:@"nicheng"];
        }
        
        NSString * sex =  [FAJUserDef objectForKey:@"sex"];
        if (sex.length>0) {
            [[AVUser currentUser] setObject:sex forKey:@"gender"];
        }
        NSString * age =  [FAJUserDef objectForKey:@"age"];
        if (age.length>0) {
            [[AVUser currentUser] setObject:age  forKey:@"age"];
        }
        NSString * work =  [FAJUserDef objectForKey:@"work"];
        if (work.length>0) {
             [[AVUser currentUser] setObject:work  forKey:@"education"];
        }
        NSString * profession =  [FAJUserDef objectForKey:@"profession"];
        if (profession.length>0) {
           [[AVUser currentUser] setObject:profession  forKey:@"profession"];
        }
        NSString * post =  [FAJUserDef objectForKey:@"post"];
        if (post.length>0) {
           [[AVUser currentUser] setObject:post  forKey:@"post"];
        }
        
        NSString * couty =  [FAJUserDef objectForKey:@"couty"];
        if (couty.length>0) {
             [[AVUser currentUser] setObject:couty  forKey:@"couty"];
        }
        NSString * salary =  [FAJUserDef objectForKey:@"salary"];
        if (salary.length>0) {
            [[AVUser currentUser] setObject:salary  forKey:@"mondey"];
        }
        
        NSString * person =  [FAJUserDef objectForKey:@"person"];
        if (person.length>0) {
            [[AVUser currentUser] setObject:person  forKey:@"person"];
        }
        
        
        [[AVUser currentUser] saveEventually:^(BOOL succeeded, NSError * _Nullable error) {
            if (succeeded)
            {
                NSString * nicheng =[AVUser currentUser][@"nicheng"];
                NSString * gender =[AVUser currentUser][@"gender"];
                NSString * age =[AVUser currentUser][@"age"];
                NSString * education =[AVUser currentUser][@"education"];
                NSString * profession =[AVUser currentUser][@"profession"];
                NSString * post =[AVUser currentUser][@"post"];
                NSString * couty =[AVUser currentUser][@"couty"];
                NSString * mondey =[AVUser currentUser][@"mondey"];
                NSString * person =[AVUser currentUser][@"person"];
                if (nicheng.length>0&&gender.length>0&&age.length>0&&education.length>0&&profession.length>0&&post.length>0&&couty.length>0&&mondey.length>0&&person.length>0) {
                  
                    
                    [FAJUserDef setObject:@"1" forKey:@"tianxieziliaook"];
                    
                    
                }
               
                [MBProgressHUD showSuccess:@"保存成功" toView:self.view];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [MBProgressHUD showError:error.userInfo[@"error"] toView:self.view];
            }
        }];
        
        
    }else{
        
        self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[GAFAJLoginViewController alloc] init]];
        
    }
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //让键盘下去
    [self.nameField resignFirstResponder];
    [self.showperson resignFirstResponder];
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    if (textField.text.length>0) {
        [FAJUserDef setObject:textField.text forKey:@"nicheng"];
    }
    
    
    
    
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    
    [FAJUserDef setObject:textView.text forKey:@"person"];
}
@end
