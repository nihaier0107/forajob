//
//  FAJBaseDBManager.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAJBaseDBManager : NSObject
@property (nonatomic,strong) FMDatabase *database;
@property (nonatomic,strong) FMDatabaseQueue *databaseQueue;

/**
 * 获取当前实例
 */
+ (instancetype)sharedManager;
/**
 *从mainBundle复制DB到缓存目录
 */
-(BOOL)copyMainBundleDBFile:(NSString*)mainBundlePath ToCachePath:(NSString *)cachePath;
/**
 *创建缓存DB文件
 */
-(BOOL)createCacheDBFilePath:(NSString *)cachePath;
/**
 * 链接数据库
 */
-(BOOL)connectDBWithPath:(NSString *)path;
/**
 * 升级数据库
 */
-(BOOL)upgradeDB;
/**
 * 设置nil，并清空数据
 */
-(void)clearSelf;
//--------------dbInfo---------
/**
 *创建dbInfo表
 */
-(BOOL)createDBInfoTable;
/**
 *设置version
 */
-(BOOL)setDBInfoVersion:(NSInteger)version;
/**
 *获取数据库version
 */
-(NSInteger)getDBInfoVersion;
/**
 *判断数据库中的表是否存在
 */
-(BOOL)isExistTable:(NSString *)tableName;
/**
 *判断表中是否存在某个字段
 */
-(BOOL)isExistColumn:(NSString *)columnName createSql:(NSString *)createSqlStr;
/**
 *判断表中是否存在某个字段
 */
-(BOOL)isExistColumn:(NSString *)columnName ofTable:(NSString *)tableName;
@end

NS_ASSUME_NONNULL_END
