//
//  ILActivityView.m
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILActivityView.h"
@interface ILActivityView()
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *buttonText;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation ILActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark -property
-(void)setActivity:(ILActivity *)activity{
    //TODO 在这里更新模型
}

#pragma mark -init
-(void)initViews{
    
}


@end
