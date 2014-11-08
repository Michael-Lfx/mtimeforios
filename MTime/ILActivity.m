//
//  ILActivity.m
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILActivity.h"

@implementation ILActivity

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)activityWithDic:(NSDictionary *)dic {
    return [[self alloc]initWithDic:dic];
}

@end
