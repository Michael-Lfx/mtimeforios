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
#import "ILCoupNetPackage.h"
#import "ILActivity.h"

@interface ILCoupController ()<NSURLConnectionDataDelegate>

@property(nonatomic,strong)ILCoupNetPackage * coupNetPackage;
@property(nonatomic,strong)UIScrollView * activitiesScrollView;

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

#pragma mark -propery
-(void)setCoupNetPackage:(ILCoupNetPackage *)coupNetPackage{
    
    self.activitiesScrollView.contentSize=CGSizeMake(200*coupNetPackage.activities.count, 500);
    for (ILActivity *activity in coupNetPackage.activities) {
    }
}


#pragma mark -init
-(void)initData{
    NSString *strUrl=[NSString stringWithFormat:@"http://api.m.mtime.cn/Advertisement/LimitedTimeActivitiesByCoupon.api?locationId=%d",366];
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:strUrl]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)initViews{
    self.navigationItem.title=@"限时活动";
    UIImage *bg=[UIImage imageNamed:@"recommend_index_trailer_blackbg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bg]];
    
    self.activitiesScrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.activitiesScrollView];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSLog(@"有响应了");
    NSDictionary *obj= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.coupNetPackage= [ILCoupNetPackage coupNetPackageWithDictionary:obj];
}


@end
