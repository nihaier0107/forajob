//
//  SelectedDataPerfectView.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/11.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "SelectedDataPerfectView.h"
@interface SelectedDataPerfectView()<UIPickerViewDataSource,UIPickerViewDelegate>

{
    
    
}
//PopTipsTypesex = 1,//性别
//PopTipsTypeage,//年龄
//PopTipsTypeeducation,//学历
//PopTipsTypeprofession,//行业
//PopTipsTypepost,//岗位
//PopTipsTypecouty,//国家
//PopTipsTypemondey,//薪资
@property (nonatomic) NSMutableArray * sexdata;
@property (nonatomic) NSMutableArray * agedata;
@property (nonatomic) NSMutableArray * educationdata;
@property (nonatomic) NSMutableArray * professiondata;
@property (nonatomic) NSMutableArray * postdata;
@property (nonatomic) NSMutableArray * coutydata;
@property (nonatomic) NSMutableArray * mondeydata;
@end
@implementation SelectedDataPerfectView
-(void)saveclick:(UIButton *)sender{
    
    self.saveBlock(sender);
}
-(void)backclick:(UIButton *)sender{
   
    self.guanbiBlock(sender);
}
-(instancetype)initWithFrame:(CGRect)frame WithpoptipsType:(PopTipsType)tipsType;
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _tipsType = tipsType;
        [self initView];
    }
    return self;
}
-(void)initView{
    
    self.sexdata = [NSMutableArray arrayWithObjects:@"男",@"女", nil];
    self.agedata = [NSMutableArray arrayWithObjects:@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50", nil];
    
    self.educationdata = [NSMutableArray arrayWithObjects:@"小学",@"初中",@"高中",@"大专",@"本科",@"硕士",@"博士", nil];
    
    self.professiondata = [NSMutableArray arrayWithObjects:@"农、林、牧、渔业",@"采矿业",@"制造业",@"建筑业",@"批发和零售业",@"餐饮业",@"教育",@"服务业",@"金融业",@"娱乐业", nil];
    
    self.postdata =[NSMutableArray arrayWithObjects:@"销售员",@"铆工",@"车辆维修",@"货运司机",@"美甲师",@"美容师",@"美发师",@"缝纫",@"刺绣",@"电焊工",@"电工",@"管道工",@"烘焙",@"清洁工",@"海员",@"普工",@"厨师/厨师长",@"油漆工",@"木工",@"机器维修",@"服务员",@"普通司机",@"普工",@"按摩师" ,@"操作员",@"护理/护工",@"护士",@"帮厨/杂工",@"咖啡师",@"其他工种",nil];
    
    self.coutydata =  [NSMutableArray arrayWithObjects:@"环球航线",@"柬埔寨",@"日本",@"新西兰",@"新加坡",@"巴基斯坦",@"尼泊尔",@"尼日利亚",@"安哥拉",@"孟加拉",@"奥地利",@"太平洋航线",@"大阪",@"塞内加尔",@"埃及",@"国际航线",@"印尼",@"卡塔尔",@"中国香港",@"中国",@"东南亚航线",@"SINGAPORE",@"静冈",@"名古屋",@"中国香港",@"马尔代夫",@"韩国",@"阿联酋/迪拜",@"阿根廷",@"阿曼",@"荷兰", nil];
    
    self.mondeydata =[NSMutableArray arrayWithObjects:@"5万以下/年",@"5-10万/年",@"10-15万/年",@"15-20万/年",@"20-30万/年",@"30-40万/年",@"40-50万/年",@"40-50万/年",@"50万以上/年", nil];
    
    self.userInteractionEnabled = YES;
    self.backgroundColor =[UIColor clearColor];
    UIView * bgviw=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WLScreen_width, WLScreen_height)];
    bgviw.alpha = 0.7;
    bgviw.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0];
    [self addSubview:bgviw];
    UIView *labelview = [[UIView alloc] init];
    labelview.frame = CGRectMake(0,WLScreen_height-60-198,WLScreen_width,60+198);
    labelview .alpha = 1.0;
    labelview.userInteractionEnabled = YES;
    labelview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    [self addSubview:labelview];
    UIView *viewline = [[UIView alloc] init];
    viewline.frame = CGRectMake(0.5,60,labelview.width-1,0.5);
    viewline.alpha = 0.17;
    viewline.backgroundColor = [UIColor colorWithHexString:@"#707070"];
    [labelview addSubview:viewline];
   
    
    
    UILabel * title =[[UILabel alloc]initWithFrame:CGRectMake(30, 20, labelview.width-60, 22)];
    title.textColor =[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    title.textAlignment = NSTextAlignmentCenter;
    title.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    switch (_tipsType) {
        case 1:
            title.text=@"性别";
            break;
        case 2:
            title.text=@"年龄";
            break;
        case 3:
            title.text=@"学历";
            break;
        case 4:
            title.text=@"期望行业";
            break;
        case 5:
            title.text=@"期望岗位";
            break;
        case 6:
            title.text=@"期望国家";
            break;
        case 7:
            title.text=@"期望薪资";
            break;
            
            
        default:
            break;
    }
    
    
    [labelview addSubview:title];
    UIPickerView *pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 60, WLScreen_width, 198)];
    pickView.showsSelectionIndicator = YES;
    pickView.backgroundColor = [UIColor whiteColor];
    pickView.alpha = 1;
    pickView.delegate = self;
    pickView.dataSource = self;
    [labelview addSubview:pickView];
    [pickView selectRow:0 inComponent:0 animated:YES];
    
    
    switch (_tipsType) {
        case 1:
            [FAJUserDef setObject:self.sexdata[0] forKey:@"sex"];
            
            break;
        case 2:
            [FAJUserDef setObject:self.agedata[0] forKey:@"age"];
            
            break;
        
        case 4:
            [FAJUserDef setObject:self.professiondata[0] forKey:@"profession"];
            
           
            break;
        case 5:
            [FAJUserDef setObject:self.postdata[0] forKey:@"post"];
            
            
          
            break;
        case 6:
            [FAJUserDef setObject:self.coutydata[0] forKey:@"couty"];
            
           
            break;
        
           
            
            
        default:
            break;
    }
    
    
    if (_tipsType==3) {
        
        BOOL isno = YES;
        NSString * work =  [FAJUserDef objectForKey:@"work"];
        if (work.length>0) {
            for (int i=0; i<self.educationdata.count; i++) {
                
                if ([work isEqualToString:self.educationdata[i]]) {
                    
                    [pickView selectRow:i inComponent:0 animated:YES];
                    
                    isno = NO;
                }
            }
            
            
            
        }
        if (isno) {
            
            [FAJUserDef setObject:self.educationdata[0] forKey:@"work"];
        }
    }
    
    if (_tipsType==7) {
        BOOL isno = YES;
        NSString * work =  [FAJUserDef objectForKey:@"salary"];
        if (work.length>0) {
            for (int i=0; i<self.educationdata.count; i++) {
                
                if ([work isEqualToString:self.educationdata[i]]) {
                    
                    [pickView selectRow:i inComponent:0 animated:YES];
                    
                    isno = NO;
                }
            }
            
            
            
        }
        if (isno) {
            
            [FAJUserDef setObject:self.educationdata[0] forKey:@"salary"];
        }
    }
    
    
    UIButton * back = [UIButton new];
    [back setImage:[UIImage imageNamed:@"zhfanhui"] forState:UIControlStateNormal];
    back.frame = CGRectMake(0, 10, 20, 20);
    back.centerY = title.centerY;
    [back addTarget:self action:@selector(backclick:) forControlEvents:UIControlEventTouchUpInside];
    [labelview addSubview:back];
    UIButton * save = [UIButton new];
    [save setTitleColor:[UIColor colorWithRed:0/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [save setTitle:@"保存" forState:UIControlStateNormal];
    save.frame = CGRectMake(labelview.width-50, 14, 40, 20);
    save.centerY = title.centerY;
    save.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [save addTarget:self action:@selector(saveclick:) forControlEvents:UIControlEventTouchUpInside];
    [labelview addSubview:save];
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (_tipsType) {
        case 1:
            return  self.sexdata.count;
            break;
        case 2:
           return  self.agedata.count;
            break;
        case 3:
            return  self.educationdata.count;
            break;
        case 4:
           return  self.professiondata.count;
            break;
        case 5:
           return  self.postdata.count;
            break;
        case 6:
          return  self.coutydata.count;
            break;
        case 7:
           return  self.mondeydata.count;
            break;
            
            
        default:
            break;
    }
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30.0f;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    
    switch (_tipsType) {
        case 1:
            return  self.sexdata[row];
            break;
        case 2:
            return  self.agedata[row];
            break;
        case 3:
            return  self.educationdata[row];
            break;
        case 4:
            return  self.professiondata[row];
            break;
        case 5:
            return  self.postdata[row];
            break;
        case 6:
            return  self.coutydata[row];
            break;
        case 7:
            return  self.mondeydata[row];
            break;
            
            
        default:
            break;
    }
    
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
    
    switch (_tipsType) {
        case 1:
            pickerLabel.text = self.sexdata[row];
            break;
        case 2:
            pickerLabel.text =  self.agedata[row];
            break;
        case 3:
            pickerLabel.text =   self.educationdata[row];
            break;
        case 4:
            pickerLabel.text =   self.professiondata[row];
            break;
        case 5:
            pickerLabel.text =  self.postdata[row];
            break;
        case 6:
           pickerLabel.text =   self.coutydata[row];
            break;
        case 7:
           pickerLabel.text =   self.mondeydata[row];
            break;
            
            
        default:
            break;
    }
    
    
    
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    pickerLabel.textColor = [UIColor colorWithHexString:@"#2E2E2E"];
    pickerLabel.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    
    
    return pickerLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    
    switch (_tipsType) {
        case 1:
            [FAJUserDef setObject:self.sexdata[row] forKey:@"sex"];
            
            break;
        case 2:
            [FAJUserDef setObject:self.agedata[row] forKey:@"age"];
            
            break;
        case 3:
           [FAJUserDef setObject:self.educationdata[row] forKey:@"work"];
            
            
            break;
        case 4:
            [FAJUserDef setObject:self.professiondata[row] forKey:@"profession"];
            
            
            break;
        case 5:
            [FAJUserDef setObject:self.postdata[row] forKey:@"post"];
            
            
            
            break;
        case 6:
            [FAJUserDef setObject:self.coutydata[row] forKey:@"couty"];
            
            
            break;
            
        case 7:
            [FAJUserDef setObject:self.educationdata[row] forKey:@"salary"];
            
            
            break;
            
            
        default:
            break;
    }
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
