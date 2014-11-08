//
//  ILCoupController.m
//  MTime
//具体思路
//1.网络获取信息
//2.根据activities计算scrollview的宽度
//3.scrollview的切换
//  Created by asili on 14-11-7.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILCoupController.h"
#import "ILMTimeLogo.h"

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
    [self initData];
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)initData{
    
}

-(void)initViews{
    self.navigationItem.title=@"限时活动";
    UIImage *bg=[UIImage imageNamed:@"recommend_index_trailer_blackbg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bg]];
}
@end
