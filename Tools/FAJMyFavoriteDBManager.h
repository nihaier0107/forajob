//
//  FAJMyFavoriteDBManager.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJBaseDBManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface FAJMyFavoriteDBManager : FAJBaseDBManager
/**
 * 升级数据库
 */
- (BOOL) upgradeDB;

+ (instancetype)sharedManager;

/**
 *  新增一种国家
 *
 *  @param focusItem 国家名称
 *
 *  @return 执行结果
 */
- (BOOL)insertDateDaysWith:(NSString *)focusItem;

/**
 *  查询所有国家
 *
 *  @return 所有国家名称信息
 */
- (NSArray *)queryAllDateDays;
/**
 *  删除一个国家
 *
 *  @param objectId 国家名称
 *
 *  @return 执行结果
 */
- (BOOL)deleteLearnWordsWith:(NSString *)objectId;


-(BOOL)isExistDateDays:(NSString*)objectId;
@end

NS_ASSUME_NONNULL_END
