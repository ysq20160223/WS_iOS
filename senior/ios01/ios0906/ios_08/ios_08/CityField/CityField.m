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

@property (nonatomic, assign) NSInteger selectedProvinceIndex; // 选中省份的下标

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
        Provinces *p = self.provinces[_selectedProvinceIndex];
        return p.cities.count;
    }
}

// 省份
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(0 == component) {
        _selectedProvinceIndex = row;
        
        [pickerView reloadComponent:1]; // 刷新城市列
        
        [pickerView selectRow:0 inComponent:1 animated:YES]; // 指定刷新列和行
    }
    
    Provinces *p = self.provinces[_selectedProvinceIndex]; // 选中的省份
    NSArray *cities = p.cities; // 获取选中的城市
    NSInteger cityINdex = [pickerView selectedRowInComponent:1];
    self.text = [NSString stringWithFormat:@"%@ - %@", p.name, cities[cityINdex]];
}

// 赋值
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (0 == component) {
        Provinces *p = self.provinces[row];
        return p.name;
    } else {
        Provinces *p = self.provinces[_selectedProvinceIndex];
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
    if(!_isInit) {
        _isInit = YES;
        [self pickerView:_pickerView didSelectRow:0 inComponent:0];
    }
}

//
- (void)setUp {
    UIPickerView *pv = [[UIPickerView alloc] init];
    pv.dataSource = self;
    pv.delegate = self;
    
    _pickerView = pv;
    
    self.inputView = pv;
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end



