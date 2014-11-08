//
//  ILNetPackage.h
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILActivity.h"

@interface ILCoupNetPackage : NSObject

@property(nonatomic,strong)NSString * success;

@property(nonatomic,strong)NSString * error;

/*
 *活动
 */
@property(nonatomic,strong)NSMutableArray * activities;

-(instancetype)initWithDictionary:(NSDictionary *)dic;

+(instancetype)coupNetPackageWithDictionary:(NSDictionary *)dic;
@end
