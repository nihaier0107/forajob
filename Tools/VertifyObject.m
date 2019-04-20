//
//  VertifyObject.m
//  Myprogram
//
//  Created by Mac on 15/12/2.
//  Copyright © 2015年 Mac. All rights reserved.
//

#import "VertifyObject.h"

@implementation VertifyObject
+(BOOL)validateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma 正则匹配身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


#pragma mark - 手机号验证
+ (BOOL)checkTelNumber:(NSString*) telNumber
{
    NSString*pattern =@"^1+[3578]+\\d{9}";
    NSPredicate*pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

+ (BOOL) isHighSchoolUP
{
    NSArray *recordArray = @[@"高三", @"高二", @"高一", @"初三", @"初二", @"初一"];
    if ([recordArray containsObject:[[AVUser currentUser] objectForKey:@"currentRecord"]])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}


@end
