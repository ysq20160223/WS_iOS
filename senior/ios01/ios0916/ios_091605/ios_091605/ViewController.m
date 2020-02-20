//
//  ViewController.m
//  ios_091605
//
//  Created by Apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

// 每一秒旋转6度
#define perSecondA 6

// 每一分旋转6度
#define perMinuteA 6

// 每一小时旋转的30
#define perHourA 30

// 每一分钟时针旋转的度数 (30 / 60 = 0.5)
#define perMinuteHour 0.5

// 角度转弧度
#define angle2Rad(angle) ((angle) / 180.0 * M_PI)


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *calendarLabel;

@property (weak, nonatomic) IBOutlet UIImageView *clockView;

@property (weak, nonatomic) CALayer *secondLayer;
@property (weak, nonatomic) CALayer *minuteLayer;
@property (weak, nonatomic) CALayer *hourLayer;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addHour]; // 添加时针
    [self addMinute]; // 添加分针
    [self addSecond]; // 添加秒针
    
    [self secondChange];
    
    // 添加定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(secondChange) userInfo:nil repeats:YES];
}

// 秒针变化
- (void)secondChange {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger curSecond = components.second; // 当前秒数
    
    CGFloat secondA = curSecond * perSecondA; // 当前时间秒针应该旋转的度数
    
    self.secondLayer.transform = CATransform3DMakeRotation(angle2Rad(secondA), 0, 0, 1); // 秒针旋转
    
    // 分针变化
    NSInteger curMinute = components.minute; // 当前分钟
    CGFloat minuteA = curMinute * perMinuteA;
    self.minuteLayer.transform = CATransform3DMakeRotation(angle2Rad(minuteA), 0, 0, 1); // 分针旋转
    
    // 时针变化
    NSInteger curHour = components.hour; // 当前小时
    CGFloat hourA = curHour * perHourA + curMinute * perMinuteHour;
    self.hourLayer.transform = CATransform3DMakeRotation(angle2Rad(hourA), 0, 0, 1); // 时针旋转
    
    self.calendarLabel.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld", curHour, curMinute, curSecond];
}


// 添加秒针
- (void)addSecond {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 1, 71);
    layer.position = CGPointMake(self.clockView.bounds.size.width * .5, self.clockView.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    
    self.secondLayer = layer;
    [self.clockView.layer addSublayer:layer];
}

// 添加分针
- (void)addMinute {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 2, 51);
    layer.position = CGPointMake(self.clockView.bounds.size.width * .5, self.clockView.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    
    self.minuteLayer = layer;
    [self.clockView.layer addSublayer:layer];
}

// 添加时针
- (void)addHour {
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 3, 31);
    layer.position = CGPointMake(self.clockView.bounds.size.width * .5, self.clockView.bounds.size.height * .5);
    layer.anchorPoint = CGPointMake(.5, 1);
    
    self.hourLayer = layer;
    [self.clockView.layer addSublayer:layer];
}

@end


