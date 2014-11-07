//
//  ILCoupController.m
//  MTime
//
//  Created by asili on 14-11-7.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILCoupController.h"

@interface ILCoupController ()

@end

@implementation ILCoupController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)initViews{
    UIImage *bg=[UIImage imageNamed:@"recommend_index_trailer_blackbg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bg]];
}
@end
