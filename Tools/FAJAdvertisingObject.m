//
//  FAJAdvertisingObject.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/6.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJAdvertisingObject.h"

@implementation FAJAdvertisingObject
-(void)parseFromSeverDbData:(AVObject *)object{
    
    if (object) {
        
        if (object[@"address"]) {
            self.html = object[@"address"];
        }
        AVFile * file = object[@"seats"];
        NSString * url = file.url;
        self.url = url;
        
    }
}
@end
