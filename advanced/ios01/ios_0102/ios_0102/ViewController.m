//
//  ViewController.m
//  ios_0102
//
//  Created by Apple on 2017/7/17.
//  Copyright © 2017年 Apple. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end



@implementation ViewController

- (void)btnClick {
    // 1, 获取文本输入框的文字
    NSString *text1 = self.tf01.text;
    NSString *text2 = self.tf02.text;
    
    // 2, 将字符串转为数字
    int i1 = [text1 intValue];
    int i2 = [text2 intValue];
    
    NSLog(@"text1: %@; text2: %@", text1, text2);
    
    self.lbl.text = [NSString stringWithFormat:@"%d", i1 + i2];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end


