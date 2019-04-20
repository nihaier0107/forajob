//
//  GAFAJTabbarVC.h
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAFAJRecordViewController.h"
#import "GAFAJWorkViewController.h"
#import "GAFAJMyViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface GAFAJTabbarVC : UITabBarController

@property (strong,nonatomic) GAFAJRecordViewController *firstVC;

@property (nonatomic, retain) GAFAJMyViewController *thirdVC;
@property (nonatomic, strong) GAFAJWorkViewController *secondVC;
+(GAFAJTabbarVC*)shareInstance;
@end

NS_ASSUME_NONNULL_END

