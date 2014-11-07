//
//  ILTabBarButton.m
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBarNormalButton.h"
@interface ILTabBarNormalButton()


@end

@implementation ILTabBarNormalButton

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
    ILTabBarNormalButton *tabBarBtn= [[[NSBundle mainBundle]loadNibNamed:@"TabBarNormalButton" owner:self options:nil]lastObject];
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
