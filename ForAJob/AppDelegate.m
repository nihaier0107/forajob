//
//  AppDelegate.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "SecondScrollowViewViewController.h"
#import "ThridScrollowViewViewController.h"
#import "GAFAJTabbarVC.h"
#import "GAFAJNav.h"
#import "AppDelegate.h"
#import "GAFAJLoginViewController.h"
#import "FirstPrivacyAgreementController.h"
#import "FirstScrollowViewController.h"
#import "FirstPrivacyAgreementController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [AVOSCloud setApplicationId:@"3pCeiY4XmkqmTxALVpcVI4q3-gzGzoHsz" clientKey:@"9xbOR2jHVUUgHN6gPqaLDA6o"];
    UMConfigInstance.appKey = @"5c0f9e8ab465f56613000086";
    UMConfigInstance.channelId = @"";
    
    [MobClick startWithConfigure:UMConfigInstance];
    [MobClick setLogEnabled:YES];
    
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"secretlistView"]) {


        self.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[FirstPrivacyAgreementController alloc] init]];

    }else{

        NSString *  currentController = [FAJUserDef objectForKey:@"currentController"];
        if ([currentController isEqualToString:@"GAFAJRecordViewController"]) {
                GAFAJTabbarVC *vc = [GAFAJTabbarVC shareInstance];
                vc.selectedIndex = 0;
                self.window.rootViewController = vc;

        }else if ([currentController isEqualToString:@"ThridScrollowViewViewController"]){
            self.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[ThridScrollowViewViewController alloc] init]];
        }else if ([currentController isEqualToString:@"SecondScrollowViewViewController"]){
           self.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[SecondScrollowViewViewController alloc] init]];
        }else {
            self.window.rootViewController = [[GAFAJNav alloc] initWithRootViewController:[[FirstScrollowViewController alloc] init]];

        }



    }

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
