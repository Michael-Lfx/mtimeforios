//
//  ILTabBar.m
//  MTime
//
//  Created by asili on 14-11-5.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILTabBar.h"
#import "ILTabBarButton.h"

@interface ILTabBar ()

@property(nonatomic,strong)NSMutableArray * btns;
@property(nonatomic,strong)UIButton * homeBtn;

@end

@implementation ILTabBar

- (instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self initBtns];
        [self initBackground];
        [self initHomeButton];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self layoutBtns];
    [self layoutHomeButton];
}

- (void)initHomeButton{
    
    
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
    
    UIImage *homeBtnBg=[UIImage imageNamed:@"botmenu_icon_index"];
    UIButton *homeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //[homeBtn setBackgroundColor:[UIColor blackColor]];
    //homeBtn.autoresizesSubviews=NO;
    homeBtn.bounds=CGRectMake(0, 0, homeBtnBg.size.width*.5,homeBtnBg.size.height*.5);
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
}

- (void)layoutHomeButton{
    self.homeBtn.center=CGPointMake(160,23);
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
    for (int i=0; i<tabBarPics.count; i++) {
        ILTabBarButton *tabBarBtn=[ILTabBarButton tabBarButtonWithImage:tabBarPics[i] selectedImage:nil];
        [tabBarBtn setTitle:tabBarTitles[i]];
        [self.btns addObject:tabBarBtn];
        [self addSubview:tabBarBtn];
    }
}

- (void)layoutBtns{
    CGFloat btnW=self.bounds.size.width/self.btns.count;
    CGFloat btnH=self.bounds.size.height;
    for (int i=0; i<self.btns.count; i++) {
        ILTabBarButton *tabBarBtn =self.btns[i];
        tabBarBtn.frame=CGRectMake(i*btnW, 5, btnW, btnH);
    }
    //TODO:HOME 时光精选得特别做
}

- (NSMutableArray *)btns{
    if (!_btns) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

@end
