//
//  NetworkTools.h
//  NewZhangChu
//
//  Created by 王博 on 16/1/12.
//  Copyright © 2016年 wangbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetworkTools : NSObject

+ (AFHTTPSessionManager *)sharedHTTPSessionManager;

@end
