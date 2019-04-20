//
//  GAFReportView.h
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/10.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GAFReportView : UIView
typedef void(^commit)(id);

typedef void(^cancel)(id);

@property (nonatomic, copy) commit commitBlock;

@property (nonatomic, copy) cancel cancelBlock;

@end

NS_ASSUME_NONNULL_END
