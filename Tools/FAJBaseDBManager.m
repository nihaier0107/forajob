//
//  FAJBaseDBManager.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJBaseDBManager.h"

@implementation FAJBaseDBManager
/**
 * 获取当前实例
 */
static FAJBaseDBManager *dbManager = nil;
+ (instancetype)sharedManager;
{
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        if (!dbManager) {
            dbManager = [[self alloc] init];
            
        }
    });
    return dbManager;
}
/**
 *从mainBundle复制DB到缓存目录
 * @return cachePath 文件是否存在
 */
-(BOOL)copyMainBundleDBFile:(NSString*)mainBundlePath ToCachePath:(NSString *)cachePath;
{
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    BOOL success = [fileManager fileExistsAtPath:cachePath];
    if (!success) {
        
        success = [fileManager copyItemAtPath:mainBundlePath toPath:cachePath error:&error];
        
        if (!success) {
            NSLog(@"Failed to copyMainBundleDBFile '%@'.", [error localizedDescription]);
        }
    }
    
    return success;
    
}
/**
 *创建缓存DB文件
 */
-(BOOL)createCacheDBFilePath:(NSString *)cachePath;
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    BOOL success = [fileManager fileExistsAtPath:cachePath];
    if (!success) {
        success = [fileManager createFileAtPath:cachePath contents:nil attributes:nil];
        if (!success) {
            NSLog(@"Failed to createCacheDBFilePath '%@'.", [error localizedDescription]);
        }
    }
    return success;
}
/**
 * 链接数据库
 */
-(BOOL)connectDBWithPath:(NSString *)path;
{
    if (path == nil) {
        return NO;
    }
    NSLog(@"connectDBWithPath:%@",path);
    
    self.databaseQueue  = [FMDatabaseQueue databaseQueueWithPath:path];
    
    self.database = [FMDatabase databaseWithPath:path];
    
    [self.database setShouldCacheStatements:YES];
    
    if (![self.database open])
    {
        NSLog(@"Could not open db.");
        
        return NO;
        
    }else{
        
        return YES;
        
    }
    
}
/**
 * 升级数据库
 */
-(BOOL)upgradeDB;
{
    return YES;
}
//--------------dbInfo---------
/**
 *创建dbInfo表
 */
-(BOOL)createDBInfoTable
{
    if (![self.database open]) {
        return NO;
    }
    __block BOOL success = YES;
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        
        [db executeUpdate:@"CREATE TABLE 'dbInfo' ('version' INTEGER, 'id' INTEGER PRIMARY KEY )"];
        if ([db hadError]){
            NSLog(@"createDBInfoTable error=%@",[db lastError]);
            success = NO;
        }
        
    }];
    return success;
}
/**
 *设置version
 */
-(BOOL)setDBInfoVersion:(NSInteger)version;
{
    if (![self.database open]) {
        return NO;
    }
    __block BOOL success = YES;
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"select * from dbInfo";
        FMResultSet *rs = [db executeQuery:sql];
        NSDictionary *resultDict= nil;
        while ([rs next])
        {
            resultDict = [rs resultDictionary];
            
        }
        if (resultDict == nil) {
            [db executeUpdate:@"insert into dbInfo (version) values(?)",[NSString stringWithFormat:@"%ld",(long)version]];
            if ([db hadError]){
                NSLog(@"insert dbInfo error=%@",[db lastError]);
                success = NO;
            }
        }else{
            [db executeUpdateWithFormat:@"update dbInfo set version =%@ where id = %ld ",[NSString stringWithFormat:@"%ld",(long)version],(long)[[resultDict objectForKey:@"id"] integerValue]];
            if ([db hadError]){
                NSLog(@"update dbInfo error=%@",[db lastError]);
                success = NO;
            }
        }
        
        
    }];
    return success;
}
-(NSInteger)getDBInfoVersion
{
    if (![self.database open]) {
        return NO;
    }
    __block NSInteger version = 1;//默认是第一版
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        NSString *sql = @"select * from dbInfo";
        FMResultSet *rs = [db executeQuery:sql];
        NSDictionary *resultDict= nil;
        while ([rs next])
        {
            resultDict = [rs resultDictionary];
            version = [[resultDict objectForKey:@"version"] integerValue];
        }
        
    }];
    return version;
}
/**
 *判断表中是否存在某个字段
 */
-(BOOL)isExistColumn:(NSString *)columnName createSql:(NSString *)createSqlStr{
    NSRange range = [createSqlStr rangeOfString:columnName];
    if (range.length >0) {
        return YES;
    }else{
        return NO;
    }
}
/**
 *判断表中是否存在某个字段
 */
-(BOOL)isExistColumn:(NSString *)columnName ofTable:(NSString *)tableName;
{
    NSString  *createSqlStr = [self getTableSQL:tableName];
    return [self isExistColumn:columnName createSql:createSqlStr];
}
/**
 *  查询数据库中某张表的字段
 *
 *  @param tableName 表明称
 *
 *  @return BOOL
 */
- (BOOL)isExistTable:(NSString *)tableName
{
    NSString  *createSqlStr = [self getTableSQL:tableName];
    
    if (createSqlStr != nil){
        return YES;
    }else{
        return NO;
    }
}
/**
 *  查询数据库中某张表的字段
 *
 *  @param tableName 表明称
 *
 *  @return sql
 */
- (NSString *)getTableSQL:(NSString *)tableName
{
    __block NSString  *createSqlStr = nil;
    [self.databaseQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:@"SELECT sql FROM sqlite_master WHERE type='table' AND tbl_name=?",tableName];
        while ([rs next]) {
            createSqlStr = [rs stringForColumnIndex:0];
        }
        [rs close];
    }];
    return createSqlStr;
}
/**
 * 设置nil，并清空数据
 */
-(void)clearSelf;
{
    if ([self.database open]){
        [self.database close];
    }
    if (self.databaseQueue) {
        [self.databaseQueue close];
        
    }
    self.databaseQueue = nil;
    self.database = nil;
    dbManager = nil;
}
@end
