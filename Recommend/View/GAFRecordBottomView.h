//
//  GAFRecordBottomView.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/9.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GAFRecordBottomView : UIView
typedef void(^shoucang)(id);

typedef void(^toudi)(id);

@property (nonatomic, copy) shoucang shoucangBlock;

@property (nonatomic, copy) toudi toudiBlock;
@property(nonatomic,strong)UIButton * shoucangButton;
@property(nonatomic,strong)UIButton * toudiButton;
@end

NS_ASSUME_NONNULL_END
