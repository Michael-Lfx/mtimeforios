//
//  ILActivityView.m
//  MTime
//
//  Created by asili on 14-11-8.
//  Copyright (c) 2014年 IL. All rights reserved.
//

#import "ILActivityView.h"
#import "ILActivity.h"

@interface ILActivityView()<NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIButton *buttonText;
@property (weak, nonatomic) IBOutlet UIImageView *image;


@end

@implementation ILActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


#pragma mark -static methods
+(instancetype)activityView{
    ILActivityView *activityView= [[[NSBundle mainBundle]loadNibNamed:@"ActivityView"
                                                                owner:self options:nil] lastObject];
    activityView.backgroundColor=[UIColor clearColor];
    return activityView;
}

#pragma mark -property
-(void)setActivity:(ILActivity *)activity{
    
    [self.buttonText setTitle:activity.buttonText forState:UIControlStateNormal];
    NSString *price=[activity.price stringByReplacingOccurrencesOfString:@"$" withString:@""];
    [self.price setText:price];
    
    NSMutableURLRequest *requset=[[NSMutableURLRequest alloc]
                                   initWithURL:[NSURL URLWithString:activity.imageUrl]];
    [NSURLConnection connectionWithRequest:requset delegate:self];
    
}

#pragma mark -URLConnectionDelegate
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    UIImage *image= [UIImage imageWithData:data];
    self.image.image=image;
}

#pragma mark -publicMethods
-(void)setHeightlight:(BOOL)isHeightlight{
    self.layer.opacity=isHeightlight?1:0.5;
    [self setNeedsDisplay];
}

@end
