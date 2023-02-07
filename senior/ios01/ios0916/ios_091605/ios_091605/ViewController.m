//
//  ViewController.m
//  ios_091605
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#define perSecondA 6 // 每一秒旋转6度
#define perMinuteA 6 // 每一分旋转6度
#define perHourA 30 // 每一小时旋转的30

#define perMinuteHour 0.5 // 每一分钟时针旋转的度数 (30 / 60 = 0.5)
#define angle2Rad(angle) ((angle) / 180.0 * M_PI) // 角度转弧度


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblCalendar;

@property (weak, nonatomic) IBOutlet UIImageView *ivClock;

@property (weak, nonatomic) CALayer *layerSecond;
@property (weak, nonatomic) CALayer *layerMinute;
@property (weak, nonatomic) CALayer *layerHour;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addHour]; // 添加时针
    [self addMinute]; // 添加分针
    [self addSecond]; // 添加秒针
    
    [self secondChange];
    
    // 添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(secondChange) userInfo:nil repeats:YES];
}

// 秒针变化
- (void)secondChange {
    NSDateComponents *components = [NSCalendar.currentCalendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:NSDate.date];
    
    NSInteger curSecond = components.second; // 当前秒数
    CGFloat secondA = curSecond * perSecondA; // 当前时间秒针应该旋转的度数
    
    self.layerSecond.transform = CATransform3DMakeRotation(angle2Rad(secondA), 0, 0, 1); // 秒针旋转
    
    // 分针变化
    NSInteger curMinute = components.minute; // 当前分钟
    CGFloat minuteA = curMinute * perMinuteA;
    self.layerMinute.transform = CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1); // 分针旋转
    
    // 时针变化
    NSInteger curHour = components.hour; // 当前小时
    CGFloat hourA = curHour * perHourA + curMinute * perMinuteHour;
    self.layerHour.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1); // 时针旋转
    
    self.lblCalendar.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", curHour, curMinute, curSecond];
}


// 添加秒针
- (void)addSecond {
    CALayer *layer = CALayer.layer;
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 81);
    layer.position = CGPointMake(self.ivClock.bounds.size.width * .5, self.ivClock.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    layer.cornerRadius = 0.5;
    
    self.layerSecond = layer;
    [self.ivClock.layer addSublayer:layer];
}

// 添加分针
- (void)addMinute {
    CALayer *layer = CALayer.layer;
    layer.backgroundColor = UIColor.blackColor.CGColor;
    layer.bounds = CGRectMake(0, 0, 2.5, 51);
    layer.position = CGPointMake(self.ivClock.bounds.size.width * .5, self.ivClock.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    layer.cornerRadius = 1;
    
    self.layerMinute = layer;
    [self.ivClock.layer addSublayer:layer];
}

// 添加时针
- (void)addHour {
    CALayer *layer = CALayer.layer;
    layer.backgroundColor = UIColor.blackColor.CGColor;
    layer.bounds = CGRectMake(0, 0, 4, 31);
    layer.position = CGPointMake(self.ivClock.bounds.size.width * .5, self.ivClock.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    layer.cornerRadius = 2;
    
    self.layerHour = layer;
    [self.ivClock.layer addSublayer:layer];
}

@end


