//
//  GAFAJPrivacyAgreementView.h
//  GoingAbroadForAJob
//
//  Created by 乔光玉 on 2018/12/5.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GAFAJPrivacyAgreementView : UIView
typedef void(^cancelPrivacyAgreementView)(id);

typedef void(^turePrivacyAgreementView)(id);

@property (nonatomic, copy) cancelPrivacyAgreementView cancelBlock;

@property (nonatomic, copy) turePrivacyAgreementView tureBlock;
@end

NS_ASSUME_NONNULL_END
