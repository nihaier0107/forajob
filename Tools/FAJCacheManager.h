//
//  FAJCacheManager.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface FAJCacheManager : FAJBaseObject
/**
 * 获取当前的缓存管理实例
 */
+ (FAJCacheManager *)shareCacheManager;

#pragma mark Directory
/**
 * 获取应用程序document目录
 */
+ (NSString *)documentDirectory;
/**
 * 获取应用程序的缓存目录
 */
+ (NSString *)cacheDirectory;
/**
 * 获取应用程序的临时目录
 */
+(NSString *)tempDirectory;
@end

NS_ASSUME_NONNULL_END
