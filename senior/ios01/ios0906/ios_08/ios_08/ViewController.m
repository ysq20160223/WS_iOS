//
//  ViewController.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "FlagField.h"


@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *flagField;
@property (weak, nonatomic) IBOutlet UITextField *birthField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _flagField.delegate = self;
    _birthField.delegate = self;
    _cityField.delegate = self;
}

// 是否允许用户输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSLog(@"string: %@", string);
    return NO;
}

// 给文本框初始化 - (id 能调用任何对象的方法)
- (void)textFieldDidBeginEditing:(id)textField {
//    NSLog(@"");
    [textField initText];
}


@end




