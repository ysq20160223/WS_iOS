//
//  EditVc.m
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditVc.h"

@interface EditVc ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end





@implementation EditVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 及时监听文本框输入
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 控制器之间传值, 一般在 viewDidLoad 中给控件赋值
    _nameField.text = self.contact.name;
    _phoneField.text = self.contact.phone;
    
    [self textChange];
}

// 文本改变
- (void)textChange {
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
    NSLog(@"enabled: %d", _saveBtn.enabled);
    if (_saveBtn.enabled) {
        _saveBtn.backgroundColor = [UIColor colorWithRed:102.0/255 green:1 blue:102.0/255 alpha:1];
    } else {
        _saveBtn.backgroundColor = [UIColor colorWithRed:204.0/255 green:1 blue:153.0/255 alpha:1];
    }
}


//
- (IBAction)edit:(UIBarButtonItem *)sender {
    NSLog(@"%@", sender.title);
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Cancel";
        
        _nameField.enabled = YES;
        _nameField.textColor = [UIColor blackColor];
        _phoneField.enabled = YES;
        _phoneField.textColor = [UIColor blackColor];
        
        _saveBtn.hidden = NO;
    } else if ([sender.title isEqualToString:@"Cancel"]) {
        sender.title = @"Edit";
        
        _nameField.text = self.contact.name;
        _phoneField.text = self.contact.phone;
        
        [self textChange];
        
        _nameField.enabled = NO;
        _nameField.textColor = [UIColor lightGrayColor];
        _phoneField.enabled = NO;
        _phoneField.textColor = [UIColor lightGrayColor];
        
        _saveBtn.hidden = YES;
    }
    
}

- (IBAction)save:(UIButton *)sender {
    NSLog(@"name: %@, phone: %@", _nameField.text, _phoneField.text);
    // 更新数据模型
    self.contact.name = _nameField.text;
    self.contact.phone = _phoneField.text;
    
    // 通知 刷新 ContactViewController UITableView
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateContact" object:nil];
    
    // 回到 ContactViewController
    [self.navigationController popViewControllerAnimated:YES];
}

@end




