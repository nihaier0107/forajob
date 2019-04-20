//
//  FAJMyFavoriteDBManager.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "FAJMyFavoriteObject.h"
#import "FAJCacheManager.h"
#import "FAJMyFavoriteDBManager.h"
#define mainBundleDBName @"FAJMyFavoriteDB.sqlite"
@implementation FAJMyFavoriteDBManager
static FAJMyFavoriteDBManager * manager = nil;
static dispatch_once_t once;

+ (instancetype)sharedManager
{
    
    
    dispatch_once(&once, ^{
        if (!manager) {
            manager = [[self alloc] init];
            
            
            NSString * dbFilePath = nil;
            
            dbFilePath =[[FAJCacheManager documentDirectory] stringByAppendingPathComponent:mainBundleDBName];
            
            [manager connectDBWithPath:dbFilePath];
            [manager upgradeDB];
            
            
        }
    });
    return manager;
    
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)dealloc
{
    
}

/**
 * 设置nil，并清空数据
 */
-(void)clearSelf
{
    [super clearSelf];
    
    manager = nil;
    once = 0;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (BOOL)insertDateDaysWith:(NSString *)focusItem;

{
    if (![self.database open] || !focusItem) {
        return NO;
    }
    __block BOOL success = YES;
    //TODO:先判断是否存在word的数据
    //如果存在，就直接return YES；
    if ([self isExistDateDays:focusItem]) {
        
        return YES;
    }
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        NSString *sqlString = [NSString stringWithFormat:@"insert into FAJMyFavorite (objectId) values ('%@')", focusItem];
        
        [db executeUpdate:sqlString];
        
        if ([db hadError]) {
            NSLog(@"insert FAJMyFavorite error = %@", [db lastError]);
            
            success = NO;
        }
    }];
    
    return success;
}



- (NSArray *)queryAllDateDays
{
    if (![self.database open]) {
        return nil;
    }
    __block NSMutableArray *array = [[NSMutableArray alloc] init];
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQuery:@"select * from FAJMyFavorite"];
        
        while ([rs next]) {
            NSDictionary *fansDict = [rs resultDictionary];
            
            FAJMyFavoriteObject *Items = [[FAJMyFavoriteObject alloc] init];
            [Items parseFromDbData:fansDict];
            
            [array addObject:Items];
        }
        
        [rs close];
    }];
    
    return array;
}

- (BOOL)deleteLearnWordsWith:(NSString *)objectId
{
    
    
    
    if (![self.database open] || !objectId) {
        return NO;
    }
    __block BOOL success = YES;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdateWithFormat:@"delete from FAJMyFavorite where objectId = %@", objectId];
        
        if ([db hadError]) {
            NSLog(@"delete audios error = %@", [db lastError]);
            
            success = NO;
        }
    }];
    
    return success;
    
}

-(BOOL)isExistDateDays:(NSString*)objectId
{
    
    if (![self.database open]) {
        return NO;
    }
    __block BOOL success = NO;
    
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        
        FMResultSet *rs = [db executeQueryWithFormat:@"select * from FAJMyFavorite where objectId = %@  ",objectId];
        
        if ([rs next]) {
            
            success = YES;
            
        }
        [rs close];
    }];
    
    return success;
    
    
}




-(BOOL)upgradeDB;
{
    [super upgradeDB];
    if (![manager isExistTable:@"FAJMyFavorite"]) {
        
        [self.databaseQueue inDatabase:^(FMDatabase *db) {
            
            
            NSString * sql = @"CREATE TABLE 'FAJMyFavorite' ('objectId' VARCHAR PRIMARY KEY);";
            
            FMResultSet *rs = [db executeQuery:sql];
            if ([rs next]) {
                [self setDBInfoVersion:1];
            }
            [rs close];
            
            
            
        }];
        
        
    }
    
    if (![self isExistTable:@"dbInfo"]) {
        [self.databaseQueue inDatabase:^(FMDatabase *db) {
            NSString * sql = @"CREATE TABLE 'dbInfo' ('version' INTEGER, 'id' INTEGER PRIMARY KEY AUTOINCREMENT)";
            
            FMResultSet *rs = [db executeQuery:sql];
            if ([rs next]) {
                [self setDBInfoVersion:1];
            }
            [rs close];
            
        }];
        
    }
    
    NSInteger version = [self getDBInfoVersion];
    switch (version) {
        case 0:
            
        default:
            break;
    }
    
    
    
    return YES;
}

@end
