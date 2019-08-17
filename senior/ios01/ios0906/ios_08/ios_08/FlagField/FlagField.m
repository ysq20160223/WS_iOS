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

@interface FlagField () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *flags; //

@property (nonatomic, assign) BOOL isInit;

@end



@implementation FlagField

- (void)initText {
    if(!_isInit) {
        _isInit = YES;
        [self pickerView:nil didSelectRow:0 inComponent:0];
    }
}

// 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.flags.count;
}

// 加载视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
//    NSLog(@"pickerView");
    
    Flag *flag = self.flags[row];
    FlagView *flagView = [FlagView flagView];
    flagView.flag = flag;
    return flagView;
}

// 给文本赋值
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    Flag *flag = self.flags[row];
    self.text = flag.name;
}

// 行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 130;
}

// 从文件加载数据转模型
- (NSMutableArray *)flags {
    if(nil == _flags) {
        _flags = [NSMutableArray array];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]; // 1, file path
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path]; // 2,
        
        for (NSDictionary *dict in dicArray) {
            id obj = [Flag flagWithDict:dict];
            //            NSLog(@"obj : %@", obj);
            [_flags addObject:obj];
        }
    }
    return _flags;
}

// 初始化操作
- (void)setUp {
    // 自定义键盘
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    self.inputView = pickerView;
}

// 只要从 xib 或者 storyboard 加载就会调用这个方法, 只调用一次
- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end




