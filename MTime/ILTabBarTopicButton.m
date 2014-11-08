//
//  ILTabBarTopicButton.m
//  MTime
//
//  Created by asili on 14-11-7.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBarTopicButton.h"
@interface ILTabBarTopicButton()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundIcon;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@end

@implementation ILTabBarTopicButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
