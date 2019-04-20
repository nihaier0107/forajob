//
//  GAFAJTabbarVC.m
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "GAFAJTabbarVC.h"
#import "GAFAJNav.h"
@interface GAFAJTabbarVC ()

@end

@implementation GAFAJTabbarVC

static GAFAJTabbarVC* _myTabBarVC = nil;

+(GAFAJTabbarVC *)shareInstance{
    @synchronized(self){
        if (!_myTabBarVC) {
            _myTabBarVC = [[GAFAJTabbarVC alloc]init];
        }
    }
    return _myTabBarVC;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTabBar];
}

- (void)initTabBar{
    
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#5FB6FF"];
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:0];
    GAFAJNav * nav = [[GAFAJNav alloc]initWithRootViewController:self.firstVC];
    nav.tabBarItem.image = [[UIImage imageNamed:@"推荐未选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"推荐选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.title = @"推荐";
    [vcs addObject:nav];
    
    GAFAJNav * nav1 = [[GAFAJNav alloc]initWithRootViewController:self.secondVC];
    nav1.tabBarItem.image = [[UIImage imageNamed:@"工作未选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"工作选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.title = @"找工作";
    [vcs addObject:nav1];
    
    GAFAJNav * nav2 = [[GAFAJNav alloc]initWithRootViewController:self.thirdVC];
    nav2.tabBarItem.image = [[UIImage imageNamed:@"个人未选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"个人选中"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.title = @"我的";
    [vcs addObject:nav2];
    
    self.viewControllers = vcs;
}

-(GAFAJRecordViewController *)firstVC {
    if (!_firstVC) {
        _firstVC = [[GAFAJRecordViewController alloc] init];
    }
    return _firstVC;
}

-(GAFAJWorkViewController *)secondVC {
    if (!_secondVC) {
        _secondVC = [[GAFAJWorkViewController alloc] init];
    }
    return _secondVC;
}

-(GAFAJMyViewController *)thirdVC {
    if (!_thirdVC) {
        _thirdVC = [[GAFAJMyViewController alloc] init];
    }
    return _thirdVC;
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
