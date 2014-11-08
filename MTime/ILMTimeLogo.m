//
//  ILMTimeLogo.m
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILMTimeLogo.h"

@implementation ILMTimeLogo


+(instancetype)mtimLogo{
    UIImage *logo=[UIImage imageNamed:@"ele_logo_mtime"];
    ILMTimeLogo *logoView=[[ILMTimeLogo alloc]initWithImage:logo];
    return logoView;
}

@end
