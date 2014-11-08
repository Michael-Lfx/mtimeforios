//
//  ILActivityView.h
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ILActivity;

@interface ILActivityView : UIView

@property(nonatomic,strong)ILActivity * activity;

+(instancetype)activityView;



@end
