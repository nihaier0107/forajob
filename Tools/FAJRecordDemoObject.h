//
//  FAJRecordDemoObject.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/9.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface FAJRecordDemoObject : FAJBaseObject
@property (nonatomic, strong) AVObject * object;
@property (nonatomic, strong) NSString * descript;
@property (nonatomic, strong) NSString * workAddress;
@property (nonatomic, assign) NSInteger  contractYear;
@property (nonatomic, strong) NSString * tagName;
@property (nonatomic, strong) NSString * createTime;
@property (nonatomic, strong) NSString * postName;
@property (nonatomic, strong) NSString * name;
@property(nonatomic,assign)NSInteger gender;
@property(nonatomic,assign)NSInteger minAge ;
@property(nonatomic,assign)NSInteger maxAge ;
@property(nonatomic,assign)NSInteger minSalary;
@property(nonatomic,assign)NSInteger maxSalary;
@property (nonatomic, strong)AVObject * visaType;
@property(nonatomic,assign)NSInteger  processCycle;
@property(nonatomic,assign)NSInteger  processCycleHigh;
@property(nonatomic,assign)NSInteger  education;
@property (nonatomic, strong) NSString * objectid;



@end

NS_ASSUME_NONNULL_END
