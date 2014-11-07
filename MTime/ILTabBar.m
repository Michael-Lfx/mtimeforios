//
//  ILTabBar.m
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBar.h"
#import "ILTabBarNormalButton.h"
#import "ILButtonWithNoHeightLight.h"
#define ILTopicIndex 3

@interface ILTabBar (){
    UIView *_prevTabBarBtn;
}

@property(nonatomic,strong)NSMutableArray * btns;
@property(nonatomic,strong)UIButton * homeBtn;
@property(nonatomic,strong)NSArray *tabBarPositionIndexs;

@end

@implementation ILTabBar

- (instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self initBtns];
        [self initBackground];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        
    }
    return self;
}

#pragma mark -propertyoverride
-(NSArray *)tabBarPositionIndexs{
    if (_tabBarPositionIndexs==nil) {
        _tabBarPositionIndexs=@[@(0),@(1),@(4)];
    }
    return _tabBarPositionIndexs;
}

- (NSMutableArray *)btns{
    if (!_btns) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

#pragma mark -layout

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutBtns];
    [self layoutHomeButton];
    [self registTabBarToggle];
}

- (void)layoutHomeButton{
    self.homeBtn.center=CGPointMake(160,23);
}


- (void)layoutBtns{
    CGFloat btnW=self.bounds.size.width/self.btns.count;
    CGFloat btnH=self.bounds.size.height;
    for (NSNumber *position in self.tabBarPositionIndexs) {
        int index=position.intValue;
        ILTabBarNormalButton *tabBarBtn =self.btns[index];
        tabBarBtn.frame=CGRectMake(index*btnW, 5, btnW, btnH);
    }
    UIButton *topicBtn= self.btns[ILTopicIndex];
    topicBtn.frame=CGRectMake(ILTopicIndex*btnW+15, 10, 35, 35);
    //TODO:HOME 时光精选得特别做
}

#pragma mark -init
- (void)initHomeButton{
    
    UIImage *homeBtnBg=[UIImage imageNamed:@"botmenu_icon_index"];
    UIButton *homeBtn=[ILButtonWithNoHeightLight buttonWithType:UIButtonTypeCustom];
    homeBtn.bounds=CGRectMake(0, 0, homeBtnBg.size.width*.55,homeBtnBg.size.height*.55);
    homeBtn.autoresizingMask=
    UIViewAutoresizingFlexibleLeftMargin|
    UIViewAutoresizingFlexibleRightMargin|
    UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleBottomMargin|
    UIViewAutoresizingFlexibleWidth|
    UIViewAutoresizingFlexibleHeight;
    
    
    [homeBtn setImage:homeBtnBg forState:UIControlStateNormal];
    [self addSubview:homeBtn];
    self.homeBtn=homeBtn;
    self.homeBtn.tag=2;
    [self.btns addObject:self.homeBtn];
}


- (void)initBackground{
    UIImage *bg=[UIImage imageNamed:@"botmenu_bg"];
    UIGraphicsBeginImageContext(self.bounds.size);
    [bg drawInRect:CGRectMake(0, 5, self.bounds.size.width, self.bounds.size.height-5)];
    UIImage *fitBg= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundColor=[UIColor colorWithPatternImage:fitBg];
}

- (void)initBtns{
    
    NSArray *tabBarPics=@[@"botmenu_icon_ciname",
                          @"botmenu_icon_coup",
                          @"botmenu_icon_index",
                          @"botmenu_icon_topic",
                          @"botmenu_icon_more"];
    
    NSArray *tabBarTitles=@[
                            @"影院",
                            @"优惠",
                            @"",
                            @"",
                            @"更多",
                            ];
    for (int i=0;i<tabBarPics.count;i++) {
        if (i==ILTopicIndex) {
            //TODO 时光精选需要重构
            UIButton *topicBtn=[ILButtonWithNoHeightLight buttonWithType:UIButtonTypeCustom];
            [topicBtn setBackgroundImage:[UIImage imageNamed:tabBarPics[i]]
                                forState:UIControlStateNormal];
            [self.btns addObject:topicBtn];
            topicBtn.tag=ILTopicIndex;
            [self addSubview:topicBtn];
            continue;
        }
        if (i==2) {
            [self initHomeButton];
            continue;
        }
        
        ILTabBarNormalButton *tabBarBtn=[ILTabBarNormalButton tabBarButtonWithImage:tabBarPics[i]
                                                       heightLightImage:nil];
        tabBarBtn.tag=i;
        [tabBarBtn setTitle:tabBarTitles[i]];
        [self.btns addObject:tabBarBtn];
        [self addSubview:tabBarBtn];
        
        
        
        
    }
    

}

-(void)registTabBarToggle{
    for (UIView *btn in self.btns) {
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self
                                                                           action:@selector(tabExchange:)];
        [btn addGestureRecognizer:tap];
    }
}

-(void)tabExchange:(UIView *)tabBarBtn{
    if ([tabBarBtn isKindOfClass:[ILTabBarNormalButton class]]) {
        ILTabBarNormalButton *btn=(ILTabBarNormalButton *)tabBarBtn;
        [btn setHieghtLight:YES];
    }
    
    
    if ([_prevTabBarBtn isKindOfClass:[ILTabBarNormalButton class]]) {
        ILTabBarNormalButton *btn=(ILTabBarNormalButton *)tabBarBtn;
        [btn setHieghtLight:NO];
    }
    
    
    if ([self.delegate respondsToSelector:@selector(tabBarToggleFrom: to:)]) {
        [self.delegate tabBarToggleFrom:_prevTabBarBtn.tag andTo:tabBarBtn.tag];
    }
}

@end
