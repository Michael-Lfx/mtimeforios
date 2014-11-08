//
//  ILActivity.h
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ILActivity : NSObject

@property(nonatomic,strong)NSString * title;
@property(nonatomic,strong)NSString * imageUrl;
@property(nonatomic,strong)NSString * url;
@property(nonatomic,assign)CGFloat startDate;
@property(nonatomic,assign)CGFloat  endDate;
@property(nonatomic,strong)NSString * price;
@property(nonatomic,strong)NSString * buttonText;
@property(nonatomic,assign)BOOL isOpenH5;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)activityWithDic:(NSDictionary *)dic;

@end
