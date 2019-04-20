//
//  GAFAJNav.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFAJNav.h"

@interface GAFAJNav ()

@end

@implementation GAFAJNav

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
//    
//    if (self=[super initWithRootViewController:rootViewController]) {
//        [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//        NSDictionary *attributeDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0],NSFontAttributeName,[UIColor colorWithHexString:@"#545454"],NSForegroundColorAttributeName,nil];
//        self.navigationBar.titleTextAttributes = attributeDic;
//       
//        
//    }
//    return self;
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    // 修正push控制器tabbar上移问题
    if (@available(iOS 11.0, *)){
        // 修改tabBra的frame
        CGRect frame = self.tabBarController.tabBar.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height - frame.size.height;
        self.tabBarController.tabBar.frame = frame;
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

@end
