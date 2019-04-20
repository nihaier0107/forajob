//
//  FAJMyFavoriteObject.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJMyFavoriteObject.h"

@implementation FAJMyFavoriteObject
- (void)parseFromDbData:(NSDictionary *)dict
{
    
    if (dict) {
        self.objectId  = [NSString stringWithFormat:@"%@", [dict objectForKey:@"objectId"]];
        
    }
}
@end
