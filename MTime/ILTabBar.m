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

@end

@implementation ILTabBar

-(instancetype)initWithFrame:(CGRect)frame{

    if (self=[super initWithFrame:frame]) {
        [self initBtns];
          [self initBackground];
       
//        [self initButtons];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self initButtons];
   
}


-(void)initBackground{
    UIImage *bg=[UIImage imageNamed:@"botmenu_bg"];
    UIGraphicsBeginImageContext(self.bounds.size);
    [bg drawInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    UIImage *fitBg= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundImage=fitBg;
}

-(void)initBtns{
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

-(void)initButtons{
    CGFloat btnW=self.bounds.size.width/self.btns.count;
    CGFloat btnH=self.bounds.size.height;
    for (int i=0; i<self.btns.count; i++) {
        ILTabBarButton *tabBarBtn =self.btns[i];
        tabBarBtn.frame=CGRectMake(i*btnW, 0, btnW, btnH);
        NSLog(@"%f----%f",btnW,btnH);
        //[self addSubview:tabBarBtn];
    }
    //TODO:HOME 时光精选得特别做
}

-(NSMutableArray *)btns{
    if (!_btns) {
        _btns=[NSMutableArray array];
    }
    return _btns;
}

@end
