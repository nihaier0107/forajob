//
//  FAJRecordDemoObject.m
//  ForAJob
//
//  Created by 乔光玉 on 2018/12/9.
//  Copyright © 2018年 大仙儿飘. All rights reserved.
//

#import "FAJRecordDemoObject.h"

@implementation FAJRecordDemoObject
-(void)parseFromSeverDbData:(AVObject *)object{
    
    if (object) {
        
        
        
        self.object = object;
        
        if (object[@"description"]) {
            
            self.descript = object[@"description"];
        }
        if (object[@"workAddress"]) {
            self.workAddress = object[@"workAddress"];
        }
        if (object[@"tagName"]) {
            self.tagName = object[@"tagName"];
        }
        if (object[@"createTime"]) {
            self.createTime = object[@"createTime"];
        }
        if (object[@"postName"]) {
            self.postName = object[@"postName"];
        }
        if (object[@"name"]) {
            self.name = object[@"name"];
        }
        if (object[@"visaType"]) {
            self.visaType = object[@"visaType"];
        }
        
        
        if (object[@"education"]) {
            self.education = [object[@"education"] integerValue];
        }
        
        
        if (object[@"id"]) {
            self.objectid = object[@"id"];
        }
        
        
        if (object[@"contractYear"]) {
            self.contractYear = [object[@"contractYear"] integerValue];
        }
        if (object[@"gender"]) {
            self.gender = [object[@"gender"] integerValue];
        }
        if (object[@"minAge"]) {
            self.minAge = [object[@"minAge"] integerValue];
        }
        if (object[@"maxAge"]) {
            self.maxAge = [object[@"maxAge"] integerValue];
        }
        if (object[@"minSalary"]) {
            self.minSalary = [object[@"minSalary"] integerValue];
        }
        if (object[@"maxSalary"]) {
            self.maxSalary = [object[@"maxSalary"] integerValue];
        }
        if (object[@"processCycle"]) {
            self.processCycle = [object[@"processCycle"] integerValue];
        }
        if (object[@"processCycleHigh"]) {
            self.processCycleHigh = [object[@"processCycleHigh"] integerValue] ;
        }
        
        
    }



}
@end
