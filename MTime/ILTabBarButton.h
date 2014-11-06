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

+(instancetype)tabBarButtonWithImage:(NSString *)image selectedImage:(NSString *)selectedImage;

-(void)setTitle:(NSString *)title;

@end
