//
//  ILTabBar.h
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ILTabBarDelegate <NSObject>

@optional
-(void)tabBarToggleFrom:(NSInteger)from andTo:(NSInteger)to;

@end

@interface ILTabBar : UIView

@property(nonatomic,weak)id<ILTabBarDelegate>  delegate;

@end
