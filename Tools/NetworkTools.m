//
//  NetworkTools.m
//  NewZhangChu
//
//  Created by 王博 on 16/1/12.
//  Copyright © 2016年 wangbo. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (AFHTTPSessionManager *)sharedHTTPSessionManager {
    
    // 声明静态变量用于存储单例
    static AFHTTPSessionManager * manager = nil;
    // 使用GCD方法实现多线程下原子单次操作
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    return manager;
}

@end
