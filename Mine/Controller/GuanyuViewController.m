//
//  GuanyuViewController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GuanyuViewController.h"

@interface GuanyuViewController ()

@end

@implementation GuanyuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2F2"];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,0,WLScreen_width,555);
    view .alpha = 1.0;
    
   
    [self.view addSubview:view];
    
   
    
   
   
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,WLScreen_width,555);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 0);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
   // [view.layer addSublayer:gl];
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointMake(0, 0 )];
    [path addLineToPoint:CGPointMake(0, 513)];
    [path addCurveToPoint:CGPointMake(WLScreen_width, 513) controlPoint1:CGPointMake(0, 513) controlPoint2:CGPointMake(WLScreen_width/2, 555)];
    [path addLineToPoint:CGPointMake(WLScreen_width, 0)];
    [path addLineToPoint:CGPointMake(0, 0)];
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor colorWithHexString:@"#0093FF"].CGColor;
    shapeLayer.fillColor = [UIColor colorWithHexString:@"#0093FF"].CGColor;
    shapeLayer.lineWidth = 1;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    [view.layer addSublayer:shapeLayer];
    
    UILabel *guanyulabel = [[UILabel alloc] init];
    guanyulabel.frame = CGRectMake(0,27,WLScreen_width,26);
    guanyulabel.text = @"关于我们";
    guanyulabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 19];
    guanyulabel.textAlignment = NSTextAlignmentCenter;
    guanyulabel.textColor = [UIColor whiteColor];
    guanyulabel.numberOfLines = 0;
    [self.view addSubview:guanyulabel];
    
    UIButton * button = [UIButton new];
    [button setImage:[UIImage imageNamed:@"关于我们返回"] forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 31, 10, 18);
    [button addTarget:self action:@selector(backclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIImageView * icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"工具箱1"]];
    icon.frame = CGRectMake((WLScreen_width-287/2)/2, 168, 287/2, 272/2);
    [self.view addSubview:icon];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,268,WLScreen_width,22);
    label.numberOfLines = 0;
    label.text = @"出国工作";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    UILabel *bolabel = [[UILabel alloc] init];
    bolabel.frame = CGRectMake(0,WLScreen_height-66,WLScreen_width,22);
    bolabel.numberOfLines = 0;
    
    bolabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:bolabel];
    AVQuery *versionQuery = [AVQuery queryWithClassName:@"GuanYuWoMen"];
    [versionQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count)
        {
            bolabel.text =    objects[0][@"ximxi"];
            
            
        }
    }];
    
}
-(void)backclick{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
