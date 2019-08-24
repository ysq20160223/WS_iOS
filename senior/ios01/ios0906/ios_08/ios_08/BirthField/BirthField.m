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

- (void)setUp {
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate; // 日期模式
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"]; // 地区
    [datePicker addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    self.inputView = datePicker;
    
    _datePicker = datePicker;
}

- (void)valueChange:(UIDatePicker *)datePicker {
//    NSLog(@"value Change : %@", dp.date);
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyy-MM-dd";
    self.text = [format stringFromDate:datePicker.date];
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



@end





