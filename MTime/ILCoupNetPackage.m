//
//  ILNetPackage.m
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILCoupNetPackage.h"
#import "ILActivity.h"

#define SUCCESS    @"success"
#define ERROR      @"error"
#define ACTIVITIES @"activities"

@implementation ILCoupNetPackage
- (instancetype)initWithDictionary:(NSDictionary *)dic {
	if (self = [super init]) {
		self.success = dic[SUCCESS];
		self.error = dic[ERROR];
		NSArray *activities= dic[ACTIVITIES];
		for (NSDictionary *ativityKeyValue in activities) {
			[self.activities addObject:[ILActivity activityWithDic:ativityKeyValue]];
		}
	}
	return self;
}

+ (instancetype)coupNetPackageWithDictionary:(NSDictionary *)dic {
	return [[self alloc]initWithDictionary:dic];
}


- (NSMutableArray *)activities {
	if (_activities == nil) {
		_activities = [NSMutableArray array];
	}
	return _activities;
}

@end
