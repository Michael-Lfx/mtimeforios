//
//  ILHomeController.m
//  MTime
//
//  Created by asili on 14-11-6.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILHomeController.h"
#import "ILMTimeLogo.h"
#import "Constant.h"

@interface ILHomeController ()

@property (nonatomic, strong) UIButton *homeBtn;

@end

@implementation ILHomeController

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
	[self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:MENU_TOP_BG]
												  forBarMetrics:UIBarMetricsDefault];
	self.navigationItem.titleView = [ILMTimeLogo mtimLogo];
}

@end
