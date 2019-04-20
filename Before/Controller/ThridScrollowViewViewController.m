//
//  ThridScrollowViewViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFAJTabbarVC.h"
#import "ThridScrollowViewViewController.h"
#import "GAFAJLoginViewController.h"
@interface ThridScrollowViewViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIView *view ;
    UIButton *skipButton;
    UIButton *dwtureButton;
}
@property (nonatomic, assign) BOOL issKip;
@property(nonatomic , strong)NSArray *salaryData;

@end

@implementation ThridScrollowViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *  currentController = [FAJUserDef objectForKey:@"currentController"];
    
    if (![currentController isEqualToString:@"GAFAJRecordViewController"]) {
        
        [FAJUserDef setObject:@"ThridScrollowViewViewController" forKey:@"currentController"];
    }

    //[FAJUserDef setObject:@"ThridScrollowViewViewController" forKey:@"currentController"];
    self.salaryData = [NSMutableArray arrayWithObjects:@"5万以下/年",@"5-10万/年",@"10-15万/年",@"15-20万/年",@"20-30万/年",@"30-40万/年",@"40-50万/年",@"40-50万/年",@"50万以上/年", nil];
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
    labeltwo.text = @"您期期望的薪资";
    labeltwo.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 18];
    labeltwo.textColor = [UIColor colorWithHexString:@"#000000"];
    labeltwo.alpha = 0.8;
    [view addSubview:labeltwo];
    
    
    
    UIPickerView *pickView = [[UIPickerView alloc]initWithFrame:CGRectMake((view.width-150)/2, 149, 150, view.height-149*2)];
    pickView.showsSelectionIndicator = YES;
    pickView.backgroundColor = [UIColor whiteColor];
    pickView.alpha = 1;
    pickView.delegate = self;
    pickView.dataSource = self;
    [view addSubview:pickView];
    [pickView selectRow:3 inComponent:0 animated:YES];
    [FAJUserDef setObject:self.salaryData[3] forKey:@"salary"];
    
    
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
    
    self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[GAFAJLoginViewController alloc] init]];
    
    
}

-(void)tureButtonclick:(UIButton *)sender{
    
    
    self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[GAFAJLoginViewController alloc] init]];
    
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return  self.salaryData.count;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30.0f;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    return self.salaryData[row];
    
}

// 设置PickerView分割线属性&字体属性
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // 设置分割线的颜色
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor colorWithHexString:@"#EFEFFF"];
            singleLine.alpha = 0.19 ;
            
        }
    }
    
    // 设置文字的属性
    UILabel *pickerLabel = [[UILabel alloc] init];
    
    
    pickerLabel.text = self.salaryData[row];
    
    
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    pickerLabel.textColor = [UIColor colorWithHexString:@"#2E2E2E"];
    pickerLabel.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    
    
    return pickerLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    [FAJUserDef setObject:self.salaryData[row] forKey:@"salary"];
    
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
