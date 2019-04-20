//
//  SelectedDataPerfectView.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/11.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, PopTipsType) {
    
    PopTipsTypesex = 1,//性别
    PopTipsTypeage,//年龄
    PopTipsTypeeducation,//学历
    PopTipsTypeprofession,//行业
    PopTipsTypepost,//岗位
    PopTipsTypecouty,//国家
    PopTipsTypemondey,//薪资
    
    
};
@interface SelectedDataPerfectView : UIView
typedef void(^save)(id);
typedef void(^guanbi)(id);

@property (nonatomic, copy) save saveBlock;
@property (nonatomic, copy)guanbi guanbiBlock;
@property (nonatomic, assign)PopTipsType tipsType;


-(instancetype)initWithFrame:(CGRect)frame WithpoptipsType:(PopTipsType)tipsType;
@end

NS_ASSUME_NONNULL_END
