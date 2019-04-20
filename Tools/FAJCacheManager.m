//
//  FAJCacheManager.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJCacheManager.h"

@implementation FAJCacheManager
static FAJCacheManager *cacheManager = nil;

+ (FAJCacheManager *)shareCacheManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!cacheManager) {
            cacheManager = [[FAJCacheManager alloc] init];
        }
    });
    return cacheManager;
}

+ (NSString *)documentDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    return documentDirectory;
}

+ (NSString *)cacheDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    return cacheDirectory;
}
+(NSString *)tempDirectory
{
    return  NSTemporaryDirectory();
}
+ (void)createFolder:(NSString*)folder;
{
    NSFileManager *fileMgr = [NSFileManager defaultManager];    //
    [fileMgr createDirectoryAtPath:folder withIntermediateDirectories:YES attributes:nil error:NULL];
    
}
@end
