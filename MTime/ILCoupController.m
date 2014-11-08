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
#import "ILActivityView.h"

@interface ILCoupController ()<NSURLConnectionDataDelegate,UIScrollViewDelegate>{
    CGFloat _scrollViewMaringLelf;
    CGFloat _activityViewW;
}

@property(nonatomic,strong)ILCoupNetPackage * coupNetPackage;
@property(nonatomic,strong)UIScrollView * activitiesScrollView;

@end

@implementation ILCoupController

- (void)viewDidLoad
{
     _scrollViewMaringLelf=50;
    _activityViewW=250;
    [super viewDidLoad];
    [self initData];
    [self initViews];
}

#pragma mark -propery
-(void)setCoupNetPackage:(ILCoupNetPackage *)coupNetPackage{

    //CGFloat activityW=250;
    CGFloat activityH=500;
    CGFloat contentW=_activityViewW*coupNetPackage.activities.count;
        self.activitiesScrollView.frame=CGRectMake(0, 70, contentW, activityH);
    self.activitiesScrollView.contentSize=CGSizeMake(contentW*1.3, 300);

    
    for (int i=0; i<coupNetPackage.activities.count; i++) {
        ILActivity *activity=coupNetPackage.activities[i];
        ILActivityView *activityView= [ILActivityView activityView];
        activityView.frame=CGRectMake(240*i, 0, _activityViewW, activityH);
        activityView.activity=activity;
        activityView.tag=i;
        UITapGestureRecognizer *tapGr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changScrollViewIndex:)];
        [activityView addGestureRecognizer:tapGr];
        [self.activitiesScrollView addSubview:activityView];
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
    
    self.activitiesScrollView=[[UIScrollView alloc]init];
    self.activitiesScrollView.showsVerticalScrollIndicator=NO;
    self.activitiesScrollView.contentInset=UIEdgeInsetsMake(0, _scrollViewMaringLelf, 0, 0);
    self.activitiesScrollView.delegate=self;
    //self.activitiesScrollView.pagingEnabled=YES;
    [self.view addSubview:self.activitiesScrollView];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSDictionary *obj= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.coupNetPackage= [ILCoupNetPackage coupNetPackageWithDictionary:obj];
}

#pragma mark -ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

#pragma mark -Events
-(void)changScrollViewIndex:(UIGestureRecognizer *)gesture{
    int index=gesture.view.tag;
    [self.activitiesScrollView setContentOffset:CGPointMake(index*_activityViewW-_scrollViewMaringLelf, 0) animated:YES];
}
@end
