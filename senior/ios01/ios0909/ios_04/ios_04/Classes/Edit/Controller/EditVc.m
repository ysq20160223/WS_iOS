//
//  EditVc.m
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditVc.h"

@interface EditVc ()

@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;

@property (weak, nonatomic) IBOutlet UIButton *btnSave;

@end





@implementation EditVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 及时监听文本框输入
    [_tfName addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_tfPhone addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 控制器之间传值, 一般在 viewDidLoad 中给控件赋值
    _tfName.text = self.contact.name;
    _tfPhone.text = self.contact.phone;
    
    [self textChange];
}

// 文本改变
- (void)textChange {
    _btnSave.enabled = _tfName.text.length && _tfPhone.text.length;
    NSLog(@"enabled: %d", _btnSave.enabled);
    if (_btnSave.enabled) {
        _btnSave.backgroundColor = [UIColor colorWithRed:102.0/255 green:1 blue:102.0/255 alpha:1];
    } else {
        _btnSave.backgroundColor = [UIColor colorWithRed:204.0/255 green:1 blue:153.0/255 alpha:1];
    }
}


//
- (IBAction)onClickEdit:(UIBarButtonItem *)sender {
    NSLog(@"%@", sender.title);
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Cancel";
        
        _tfName.enabled = YES;
        _tfName.textColor = UIColor.blackColor;
        _tfPhone.enabled = YES;
        _tfPhone.textColor = UIColor.blackColor;
        
        _btnSave.hidden = NO;
    } else if ([sender.title isEqualToString:@"Cancel"]) {
        sender.title = @"Edit";
        
        _tfName.text = self.contact.name;
        _tfPhone.text = self.contact.phone;
        
        [self textChange];
        
        _tfName.enabled = NO;
        _tfName.textColor = UIColor.lightGrayColor;
        _tfPhone.enabled = NO;
        _tfPhone.textColor = UIColor.lightGrayColor;
        
        _btnSave.hidden = YES;
    }
    
}

- (IBAction)onClickSave:(UIButton *)sender {
    NSLog(@"name: %@, phone: %@", _tfName.text, _tfPhone.text);
    // 更新数据模型
    self.contact.name = _tfName.text;
    self.contact.phone = _tfPhone.text;
    
    // 通知 刷新 ContactViewController UITableView
    [NSNotificationCenter.defaultCenter postNotificationName:@"updateContact" object:nil];
    
    // 回到 ContactViewController
    [self.navigationController popViewControllerAnimated:YES];
}

@end


