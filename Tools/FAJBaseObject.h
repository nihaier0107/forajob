//
//  FAJBaseObject.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FAJBaseObject : NSObject
/**
 * 解析来自数据库的数据
 */
-(void)parseFromDbData:(NSDictionary *) dict;

/**
 * 解析来自服务器的数据
 */
-(void)parseFromSeverDbData:(AVObject *)object;
@end

NS_ASSUME_NONNULL_END
