//
//  FirstPrivacyAgreementController.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "GAFAJLoginViewController.h"
#import "FirstScrollowViewController.h"
#import "AppDelegate.h"
#import "FirstPrivacyAgreementController.h"

@interface FirstPrivacyAgreementController ()
{
    UIView *dwekspabackView;
    UIButton *dwcancelButton;
    UIButton *dwtureButton;
}
@end

@implementation FirstPrivacyAgreementController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
     [FAJUserDef setObject:@"FirstPrivacyAgreementController" forKey:@"currentController"];
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(38, 59, WLScreen_width-76, WLScreen_height-59-58);
    
    view.backgroundColor = [UIColor colorWithHexString:@"#FFFFFF"];
    view.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:106/255.0 blue:163/255.0 alpha:0.28].CGColor;
    view.layer.shadowOffset = CGSizeMake(0,3);
    view.layer.shadowRadius = 15;
    view.layer.shadowOpacity = 1;
    view.layer.cornerRadius = 10;
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    
    UILabel * tekspaLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 28, view.width, 30)];
    tekspaLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 22];
    tekspaLabel.textColor = [UIColor colorWithHexString:@"#000000"];
    tekspaLabel.textAlignment = NSTextAlignmentCenter;
    tekspaLabel.numberOfLines = 0 ;
    tekspaLabel.text = @"隐私协议";
    
    [view addSubview:tekspaLabel];
    
    
    
    
    
    
    UITextView * ekspatext = [[UITextView alloc]initWithFrame:CGRectMake(24, 71, view.width-48, view.height-71-139)];
    ekspatext.backgroundColor =[UIColor clearColor];
    ekspatext.alpha = 1;
    ekspatext.font = [UIFont fontWithName:@"Helvetica Neue" size: 12];
    ekspatext.textColor = [UIColor colorWithHexString:@"#797979"];
    ekspatext.editable = NO;
    
    ekspatext.text = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:NSLocalizedString(@"useofterms1", nil) ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
    
    [view addSubview:ekspatext];
    
    dwtureButton= [UIButton buttonWithType:UIButtonTypeCustom];
    dwtureButton.frame= CGRectMake((view.width-262)/2, view.height-60-50, 262, 50);
    CAGradientLayer *gl2 = [CAGradientLayer layer];
    gl2.frame = CGRectMake(0,0,262,50);
    gl2.startPoint = CGPointMake(0, 0);
    gl2.endPoint = CGPointMake(1, 0);
    gl2.cornerRadius = 10;
    gl2.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:177/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:137/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl2.locations = @[@(0),@(1.0f)];
    [dwtureButton.layer insertSublayer:gl2 atIndex:0];
    
    dwtureButton.layer.cornerRadius = 10;
    
    [dwtureButton setTitleColor:[UIColor whiteColor]
                       forState:UIControlStateNormal];
    
    [dwtureButton setTitle:@"同意" forState:UIControlStateNormal];
    dwtureButton.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 18];
    [dwtureButton addTarget:self action:@selector(tureButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:dwtureButton];
    
    
    
    dwcancelButton= [UIButton buttonWithType:UIButtonTypeCustom];
    dwcancelButton.backgroundColor = [UIColor clearColor];
    [dwcancelButton setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.17]
                         forState:UIControlStateNormal];
    
    
    dwcancelButton.frame= CGRectMake((view.width-262)/2, view.height-50-5, 262, 50);
    
    [dwcancelButton setTitle:@"不同意" forState:UIControlStateNormal];
    
    [dwcancelButton addTarget:self action:@selector(cancelButtonclick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:dwcancelButton];
    
    
    
    
}
-(void)cancelButtonclick:(UIButton *)button{
    
    
    AppDelegate * app = [UIApplication sharedApplication].delegate;
    UIWindow *window = app.window;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
    
    
}
-(void)tureButtonclick:(UIButton *)button{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"secretlistView"];
    self.view.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[FirstScrollowViewController alloc] init]];
    
    
    
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
