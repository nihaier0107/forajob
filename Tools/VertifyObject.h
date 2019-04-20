//
//  VertifyObject.h
//  Myprogram
//
//  Created by Mac on 15/12/2.
//  Copyright © 2015年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VertifyObject : NSObject
+ (BOOL) validateEmail:(NSString *)email;
+ (BOOL)checkTelNumber:(NSString *) telNumber;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;
+ (BOOL) isHighSchoolUP;
@end
