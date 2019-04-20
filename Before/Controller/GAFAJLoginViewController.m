//
//  GAFAJLoginViewController.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "SecondScrollowViewViewController.h"
#import "ThridScrollowViewViewController.h"

#import "GAFAJNav.h"
#import "AppDelegate.h"
#import "GAFAJLoginViewController.h"

#import "FirstScrollowViewController.h"
#import "FirstPrivacyAgreementController.h"
#import "GAFAJTabbarVC.h"
#import "GAFAJLoginViewController.h"
#import "AppDelegate.h"
@interface GAFAJLoginViewController ()
<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *phoneTextField;
@property (nonatomic, strong) UITextField *verifyCodeTextField;
@property (nonatomic, strong) UIButton * getVerifyButton;
@property (nonatomic, assign) BOOL isLook;
@end

@implementation GAFAJLoginViewController
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    if (![[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"didGuide"]] isEqualToString:versionNumber])
//    {
//        AppDelegate *appdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        GuidPageView *guidePageView = [[GuidPageView alloc] initWithFrame:CGRectMake(0, 0, appdelegate.window.width, appdelegate.window.height)];
//        [appdelegate.window addSubview:guidePageView];
//    }
    
    if ([AVUser currentUser])
    {
        GAFAJTabbarVC *vc = [GAFAJTabbarVC shareInstance];
        vc.selectedIndex = 0;
        self.view.window.rootViewController =vc;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *  currentController = [FAJUserDef objectForKey:@"currentController"];
    
    if (![currentController isEqualToString:@"GAFAJRecordViewController"]) {
        
      [FAJUserDef setObject:@"GAFAJLoginViewController" forKey:@"currentController"];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    [self initView];
   
}
- (void)initView
{
    
    
    
    
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 667)];
    backImageView.image = [UIImage imageNamed:@"背景1"];
    backImageView.userInteractionEnabled = YES;
    [self.view addSubview:backImageView];
    
    UIImageView *backImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 183, SCREENWIDTH, 484)];
    backImageView2.image = [UIImage imageNamed:@"背景2"];
    backImageView2.userInteractionEnabled = YES;
    [self.view addSubview:backImageView2];
    
    UIView * backview3 = [[UIView alloc]initWithFrame:CGRectMake(0, 240, SCREENWIDTH, SCREENHEIGHT-240)];
    backview3.backgroundColor = [UIColor whiteColor];
    backview3.userInteractionEnabled = YES;
    [self.view addSubview:backview3];
    
    
    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREENWIDTH-143)/2, 77, 143, 136)];
    logoImageView.image = [UIImage imageNamed:@"工具箱1"];
    [self.view addSubview:logoImageView];
    
    
    UILabel * tilabel = [[UILabel alloc] init];
    tilabel.text = @"出国工作";
    tilabel.font = [UIFont fontWithName:@"Helvetica Neue" size: 16];
    tilabel.textAlignment = NSTextAlignmentCenter;
    tilabel.frame = CGRectMake(0, 176, SCREENWIDTH, 22);
    tilabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
    
    [self.view addSubview:tilabel];
    
    
    _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(39, tilabel.bottom+109-8, SCREENWIDTH-78-100, 38)];
    _phoneTextField.font =  [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    _phoneTextField.alpha = 0.18;
    _phoneTextField.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.80];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请填写手机号" attributes:
                                      @{NSForegroundColorAttributeName:_phoneTextField.textColor,
                                        NSFontAttributeName:_phoneTextField.font
                                        }];
    _phoneTextField.attributedPlaceholder = attrString;
    _phoneTextField.textAlignment = NSTextAlignmentLeft;
    _phoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    _phoneTextField.delegate = self;
    [self.view addSubview:_phoneTextField];
    
    UIView *phoneTFLineView = [[UIView alloc] initWithFrame:CGRectMake(_phoneTextField.left, _phoneTextField.bottom, SCREENWIDTH-78, 0.5)];
    phoneTFLineView.alpha = 0.18;
    phoneTFLineView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.80];
    [self.view addSubview:phoneTFLineView];
    
    _verifyCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(_phoneTextField.left, _phoneTextField.bottom+23, SCREENWIDTH-78, 38)];
    _verifyCodeTextField.alpha = 0.18;
    _verifyCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    _verifyCodeTextField.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    _verifyCodeTextField.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.80];
    NSAttributedString *codeAttrString = [[NSAttributedString alloc] initWithString:@"请填写验证码" attributes:
                                          @{NSForegroundColorAttributeName:_verifyCodeTextField.textColor,
                                            NSFontAttributeName:_verifyCodeTextField.font
                                            }];
    _verifyCodeTextField.attributedPlaceholder = codeAttrString;
    _verifyCodeTextField.textAlignment = NSTextAlignmentLeft;
    _verifyCodeTextField.delegate = self;
    [self.view addSubview:_verifyCodeTextField];
    
    UIView *phoneTFLineView2 = [[UIView alloc] initWithFrame:CGRectMake(_verifyCodeTextField.left, _verifyCodeTextField.bottom, _verifyCodeTextField.width, 0.5)];
    phoneTFLineView2.alpha = 0.18;
    phoneTFLineView2.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.80];
    [self.view addSubview:phoneTFLineView2];
//
    _getVerifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _getVerifyButton.backgroundColor = [UIColor clearColor];
    _getVerifyButton.frame = CGRectMake(_phoneTextField.right, _phoneTextField.top, 100, 38);
    [_getVerifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    _getVerifyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_getVerifyButton setTitleColor:[UIColor colorWithHexString:@"#0070E0"] forState:UIControlStateNormal];
    _getVerifyButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [_getVerifyButton addTarget:self action:@selector(getVerifyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_getVerifyButton];

    
    UIButton *finishButton = [UIButton buttonWithType:UIButtonTypeCustom];
    finishButton.frame = CGRectMake(39, phoneTFLineView2.bottom+51, SCREENWIDTH-78, 47);
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCREENWIDTH-78,47);
    gl.cornerRadius = 10;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(0.9787065982818604, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:196/255.0 blue:255/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:0/255.0 green:147/255.0 blue:255/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [finishButton.layer insertSublayer:gl atIndex:0];
    
    finishButton.layer.cornerRadius = 10;
    [finishButton setTitle:@"点击登录" forState:UIControlStateNormal];
    finishButton.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
    [finishButton setTitleColor:[UIColor colorWithHexString:@"ffffff"] forState:UIControlStateNormal];
    
    [finishButton addTarget:self action:@selector(finishButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:finishButton];
    
    AVQuery *versionQuery = [AVQuery queryWithClassName:@"Look"];
    [versionQuery findObjectsInBackgroundWithBlock:^(NSArray * _Nullable objects, NSError * _Nullable error) {
        if (objects.count)
        {
            AVObject *object = objects[0];
            if ([@"1" isEqualToString:object[@"isLook"]])
            {
                self.isLook = YES;
            }
            else
            {
                self.isLook = NO;
            }
        }
        else
        {
            self.isLook = YES;
        }

        if (self.isLook)
        {
            UIButton * lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
            lookButton.frame = CGRectMake(finishButton.left, finishButton.bottom+10, finishButton.width, 20);
            [lookButton setTitle:@"随便看看" forState:UIControlStateNormal];
            lookButton.titleLabel.font =[UIFont fontWithName:@"PingFangSC-Regular" size: 16];
            lookButton.alpha = 0.18;
            [lookButton setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0] forState:UIControlStateNormal];
            [lookButton addTarget:self action:@selector(lookButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:lookButton];
        }

    }];
}
- (void)lookButtonClick
{
    
    GAFAJTabbarVC *vc = [GAFAJTabbarVC shareInstance];
    vc.selectedIndex = 0;
    self.view.window.rootViewController =vc;
   
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField == _phoneTextField)
    {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"" attributes:
                                          @{NSForegroundColorAttributeName:_phoneTextField.textColor,
                                            NSFontAttributeName:_phoneTextField.font
                                            }];
        _phoneTextField.attributedPlaceholder = attrString;
        [_verifyCodeTextField resignFirstResponder];
    }
    if (textField == _verifyCodeTextField)
    {
        NSAttributedString *codeAttrString = [[NSAttributedString alloc] initWithString:@"" attributes:
                                              @{NSForegroundColorAttributeName:_verifyCodeTextField.textColor,
                                                NSFontAttributeName:_verifyCodeTextField.font
                                                }];
        _verifyCodeTextField.attributedPlaceholder = codeAttrString;
        [_phoneTextField resignFirstResponder];
    }
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (_phoneTextField.text.length == 0)
    {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"请填写手机号" attributes:
                                          @{NSForegroundColorAttributeName:_phoneTextField.textColor,
                                            NSFontAttributeName:_phoneTextField.font
                                            }];
        _phoneTextField.attributedPlaceholder = attrString;
    }
    if (_verifyCodeTextField.text.length == 0)
    {
        NSAttributedString *codeAttrString = [[NSAttributedString alloc] initWithString:@"请填写验证码" attributes:
                                              @{NSForegroundColorAttributeName:_verifyCodeTextField.textColor,
                                                NSFontAttributeName:_verifyCodeTextField.font
                                                }];
        _verifyCodeTextField.attributedPlaceholder = codeAttrString;
    }
    return YES;
}
#pragma mark 获取验证码
- (void)getVerifyButtonClick
{
    if (_phoneTextField.text.length == 0)
    {
        [MBProgressHUD showError:@"请填写手机号" toView:self.view];
        return;
    }
    else if (![VertifyObject checkTelNumber:_phoneTextField.text])
    {
        [MBProgressHUD showError:@"您输入的手机号格式不正确" toView:self.view];
        return ;
    }
    _getVerifyButton.enabled = NO;
    
    AVShortMessageRequestOptions *options = [[AVShortMessageRequestOptions alloc] init];
    options.TTL = 10;                      // 验证码有效时间为 10 分钟
    options.applicationName = @"出国工作";  // 应用名称
    options.operation = @"出国工作注册";        // 操作名称
    options.signatureName = @"出国工作";
    [AVSMS requestShortMessageForPhoneNumber:_phoneTextField.text
                                     options:options
                                    callback:^(BOOL succeeded, NSError * _Nullable error) {
                                        if (succeeded) {
                                            /* 请求成功 */
                                            [_phoneTextField resignFirstResponder];
                                            [_verifyCodeTextField becomeFirstResponder];
                                            [_getVerifyButton setTitle:@"59" forState:UIControlStateNormal];
                                            _getVerifyButton.enabled = NO;
                                            [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
                                                int second = [[_getVerifyButton currentTitle] intValue];
                                                if (second == 0)
                                                {
                                                    [_getVerifyButton setTitle:@"重新获取" forState:UIControlStateNormal];
                                                    _getVerifyButton.enabled = YES;
                                                    [timer invalidate];
                                                    timer = nil;
                                                }
                                                else
                                                {
                                                    second--;
                                                    [_getVerifyButton setTitle:[NSString stringWithFormat:@"%d", second] forState:UIControlStateNormal];
                                                }
                                            } repeats:YES];
                                        } else {
                                            /* 请求失败 */
                                            [_getVerifyButton setTitle:@"重新获取" forState:UIControlStateNormal];
                                            _getVerifyButton.enabled = YES;
                                        }
                                    }];
}

- (void)finishButtonClick
{
    if (_phoneTextField.text.length == 0)
    {
        [MBProgressHUD showError:@"请输入手机号" toView:self.view];
        return;
    }
    else if (![VertifyObject checkTelNumber:_phoneTextField.text])
    {
        [MBProgressHUD showError:@"您输入的手机号格式不正确" toView:self.view];
        return ;
    }
    else if (_verifyCodeTextField.text.length == 0)
    {
        [MBProgressHUD showError:@"请填写验证码" toView:self.view];
        return ;
    }
    [AVUser signUpOrLoginWithMobilePhoneNumberInBackground:_phoneTextField.text smsCode:_verifyCodeTextField.text block:^(AVUser *user, NSError *error) {
        // 如果 error 为空就可以表示登录成功了，并且 user 是一个全新的用户
        if (user)
        {
            int value = arc4random() % 1000000;
            user.username = [NSString stringWithFormat:@"%06d", value];
            [user saveEventually];
            GAFAJTabbarVC *vc = [GAFAJTabbarVC shareInstance];
            vc.selectedIndex = 0;
             self.view.window.rootViewController =vc;
        }
        else
        {
            [MBProgressHUD showError:[[error userInfo] objectForKey:@"error"] toView:self.view];
        }
    }];
}

- (void)keyboardShow:(NSNotification *)notif
{
    [UIView animateWithDuration:0.75 animations:^{
        self.view.frame = CGRectMake(0, -100, SCREENWIDTH, SCREENHEIGHT);
    }];
    
}

- (void)keyboardHide:(NSNotification *)notif
{
    [UIView animateWithDuration:0.75 animations:^{
        self.view.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
