//
//  ILTabBarButton.h
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ILTabBarButton : UIView

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *desc;

/**
 *  初始化TabBar按钮项
 *
 *  @param image         图标
 *  @param selectedImage 选择的图标（暂未使用）
 *
 *  @return 实例
 */
+ (instancetype)tabBarButtonWithImage:(NSString *)image
						selectedImage:(NSString *)selectedImage;

- (void)setTitle:(NSString *)title;

@end
