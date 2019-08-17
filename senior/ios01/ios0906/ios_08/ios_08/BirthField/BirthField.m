//
//  BirthField.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BirthField.h"

@interface BirthField ()
@property (nonatomic, weak) UIDatePicker *datePicker;
@end

@implementation BirthField

// 初始化默认选中
- (void)initText {
    [self valueChange:_datePicker];
}

- (void) setUp {
    UIDatePicker *dp = [[UIDatePicker alloc] init];
    
    dp.datePickerMode = UIDatePickerModeDate; // 日期模式
    
    dp.locale = [NSLocale localeWithLocaleIdentifier:@"zh"]; // 地区
    
    [dp addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    
    _datePicker = dp;
    
    self.inputView = dp;
    
}

- (void) valueChange:(UIDatePicker *)dp {
//    NSLog(@"value Change : %@", dp.date);
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    self.text = [format stringFromDate:dp.date];
}

// 01
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

// 02
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end





