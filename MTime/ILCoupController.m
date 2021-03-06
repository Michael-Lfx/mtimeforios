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
#import "Constant.h"

@interface ILCoupController () <NSURLConnectionDataDelegate, UIScrollViewDelegate> {
	CGFloat _scrollViewMaringLelf;
	CGFloat _activityViewW;
	ILActivityView *_prevHeightlightView;//上一次激活的视图
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
	
	CGFloat activityH=320;
	CGFloat contentW=_activityViewW*coupNetPackage.activities.count;
	
    [self.activitiesScrollView setContentSize:CGSizeMake(contentW,0)];//height为0,禁止上下滚动
    self.activitiesScrollView.scrollEnabled=YES;
	for (int i=0; i<coupNetPackage.activities.count; i++) {
		//获取实体
		ILActivity *activity=coupNetPackage.activities[i];
		ILActivityView *activityView= [ILActivityView activityView];
        activityView.backgroundColor=[UIColor blueColor];
		//配置视图
		activityView.frame=CGRectMake(_activityViewW*i, 0, _activityViewW, activityH);
		activityView.activity=activity;
		activityView.tag=i;//tag作为切换时的Index
						   //添加手势
		UITapGestureRecognizer *tapGr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changScrollViewIndex:)];
		[activityView addGestureRecognizer:tapGr];
		if (i==0) {
			[activityView setHeightlight:YES];
			_prevHeightlightView=activityView;
		}else{
			[activityView setHeightlight:NO];
		}
		//不能开启pageEnable
		[self.activitiesScrollView addSubview:activityView];
	}
      self.activitiesScrollView.frame=CGRectMake(0, 100, contentW, activityH);
        self.activitiesScrollView.contentOffset=CGPointMake(0, 0);
    self.activitiesScrollView.backgroundColor=[UIColor redColor];
}


#pragma mark -init
-(void)initData{
	NSString *strUrl=[NSString stringWithFormat:@"http://api.m.mtime.cn/Advertisement/LimitedTimeActivitiesByCoupon.api?locationId=%d",366];
	NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:strUrl]];
	[NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)initViews{
    //标题
    NSMutableDictionary *titleAttr=[NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName]=[UIColor whiteColor];
    titleAttr[NSFontAttributeName]=[UIFont systemFontOfSize:17];
    
    [self.navigationController.navigationBar setTitleTextAttributes:titleAttr];
    self.navigationItem.title=@"限时活动";
    
    //背景
    UIImage *bg=[UIImage imageNamed:@"recommend_index_trailer_blackbg"];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bg]];
    //初始化UIScrollView
    self.activitiesScrollView=[[UIScrollView alloc]init];
    self.activitiesScrollView.delegate=self;
    [self.view addSubview:self.activitiesScrollView];
}

#pragma mark -NSConnectionDelegate
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	NSDictionary *obj= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
	self.coupNetPackage= [ILCoupNetPackage coupNetPackageWithDictionary:obj];
}

#pragma mark -ScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
	//TODO 滑动到一半是切换
    //scrollView.contentOffset=CGPointMake(scrollView.contentOffset.x, 0);
    NSLog(@"%f",scrollView.contentOffset.y);
}

#pragma mark -Events
-(void)changScrollViewIndex:(UIGestureRecognizer *)gesture{
    ILActivityView *targetView=(ILActivityView *)gesture.view;
    [self chagneActivity:targetView];
}

-(void)chagneActivity:(ILActivityView *)activityView{

    //两次点击同一个视图
    if ([_prevHeightlightView isEqual:activityView]) {
        return;
    }
    [self.activitiesScrollView setContentOffset:CGPointMake(activityView.frame.origin.x-_scrollViewMaringLelf, 0) animated:YES];
    //视图高亮切换
    [activityView setHeightlight:YES];
    [_prevHeightlightView setHeightlight:NO];
    _prevHeightlightView=activityView;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		
	}
	return self;
}



@end
