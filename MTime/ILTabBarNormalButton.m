//
//  ILTabBarButton.m
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBarButton.h"
@interface ILTabBarButton()


@end

@implementation ILTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

+ (instancetype)tabBarButtonWithImage:(NSString *)image heightLightImage:(NSString *)selectedImage{
    ILTabBarButton *tabBarBtn= [[[NSBundle mainBundle]loadNibNamed:@"TabBarButton" owner:self options:nil]lastObject];
    [tabBarBtn.icon setImage:[UIImage imageNamed:image]];
    tabBarBtn.backgroundColor=[UIColor clearColor];
    
    return tabBarBtn;
}

- (void)setTitle:(NSString *)title{
    [self.desc setText:title];
}

-(void)setHieghtLight:(BOOL)isHeightLight{
    self.backgroundIcon.image=isHeightLight
        ?[UIImage imageNamed:@""]
        :nil;
}
@end
