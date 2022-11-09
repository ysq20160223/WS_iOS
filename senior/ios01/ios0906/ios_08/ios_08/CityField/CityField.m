//
//  CityField.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CityField.h"

#import "Provinces.h"


@interface CityField () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, assign) BOOL isInit;

//
@property (nonatomic, strong) NSMutableArray *provinces;
@property (nonatomic, weak) UIPickerView *pickerView;

@end



@implementation CityField

// 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (0 == component) {
        return self.provinces.count;
    } else {
        Provinces *p = self.provinces[[pickerView selectedRowInComponent:0]];
        return p.cities.count;
    }
}

// 省份
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"component: %ld; row: %ld", component, row);
    if(0 == component) {
        [pickerView reloadComponent:1]; // 刷新城市列
        [pickerView selectRow:0 inComponent:1 animated:YES]; // 指定刷新列和行
    }
    
    Provinces *p = self.provinces[row]; // 选中的省份
    NSArray *cities = p.cities; // 获取选中的城市
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    self.text = [NSString stringWithFormat:@"%@ - %@", p.name, cities[cityIndex]];
}

// 赋值
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (0 == component) {
        Provinces *p = self.provinces[row];
        return p.name;
    } else {
        Provinces *p = self.provinces[[pickerView selectedRowInComponent:0]];
        return p.cities[row];
    }
}

//
- (NSMutableArray *)provinces {
    if (nil == _provinces) {
        _provinces = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dict in dictArray) {
            id obj = [Provinces provincesWithDict:dict];
            [_provinces addObject:obj];
        }
    }
    return _provinces;
}

- (void)initText {
    if(!self.isInit) {
        self.isInit = YES;
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    }
}

//
- (void)setUp {
    UIPickerView *pickerView = UIPickerView.alloc.init;
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.pickerView = pickerView;
    
    self.inputView = pickerView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

@end


