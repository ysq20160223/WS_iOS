//
//  ViewController.m
//  ios_06
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *musicArray;

@end



@implementation ViewController

- (NSArray *)musicArray {
    if (nil == _musicArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"music.plist" ofType:nil];
        _musicArray = [NSMutableArray arrayWithContentsOfFile:path];
    }
    return _musicArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    _label.text = self.musicArray[0][0];
}


#pragma mark - UIPickerViewDataSource
// 总列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.musicArray.count;
}

// 每列对应的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *array = self.musicArray[component];
    return array.count;
}


#pragma mark - UIPickerViewDelegate
// 每行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *array = self.musicArray[component];
    return array[row];
}

// 每列的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 66;
}

// 选中行列数
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"component: %ld, row: %ld", component, row);
    _label.text = self.musicArray[component][row];
}

@end





