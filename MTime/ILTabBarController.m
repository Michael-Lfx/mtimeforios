//
//  ILTabBarController.m
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBarController.h"
#import "ILTabbar.h"

@interface ILTabBarController ()<ILTabBarDelegate>

@end

@implementation ILTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
