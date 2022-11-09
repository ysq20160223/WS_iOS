//
//  FlagField.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "FlagField.h"
#import "Flag.h"
#import "FlagView.h"

@interface FlagField () <UIPickerViewDelegate, UIPickerViewDataSource> {
    UIPickerView *_pickerView;

}

@property (nonatomic, strong) NSMutableArray<Flag *> *flagArray; //
@property (nonatomic, assign) BOOL isInit;

@end



@implementation FlagField

- (void)initText {
    NSLog(@"inputView: %@", self.inputView);
    if(!_isInit) {
        _isInit = YES;
        [self pickerView:_pickerView didSelectRow:0 inComponent:0];
    }
}


#pragma mark - UIPickerViewDataSource
// 列数 (必须实现)
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.flagArray.count;
}


#pragma mark - UIPickerViewDelegate
// 加载视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    //    NSLog(@"pickerView");
    
    return [FlagView flagViewWithFlag:self.flagArray[row]];
}

// 选中行 - 给文本赋值
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.text = self.flagArray[row].countryName;
}

// 行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 99;
}


#pragma mark -
// 从文件加载数据转模型
- (NSMutableArray *)flagArray {
    if(nil == _flagArray) {
        _flagArray = [NSMutableArray array];
        
        NSString *path = [NSBundle.mainBundle pathForResource:@"flags.plist" ofType:nil];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        for (NSDictionary *dict in dicArray) {
            id obj = [Flag flagWithDictionary:dict];
//            NSLog(@"obj: %@", obj);
            [_flagArray addObject:obj];
        }
        
    }
    return _flagArray;
}

// 初始化操作
- (void)setUp {
    // 自定义键盘
    _pickerView = UIPickerView.alloc.init;
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    self.inputView = _pickerView; // inputView
}


// 只要从 xib 或者 storyboard 加载就会调用这个方法, 只调用一次
- (void)awakeFromNib {
    XLog
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    XLog
    if(self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

@end


