//
//  AddVc.m
//  ios_04
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddVc.h"

#import "Contact.h"

#import "ContactsVc.h"

@interface AddVc ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//
- (IBAction)add:(UIButton *)sender;

@end



@implementation AddVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@", self.delegate);
    
    // 及时监听文本框输入
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

// 文本改变
- (void)textChange {
    //    NSLog(@"%@", _accountField.text);
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
}

// 点击添加按钮
- (IBAction)add:(UIButton *)sender {
    // 把添加的联系人信息(name, phone)传递给联系人控制器
    Contact *contact = [Contact contactWithName:_nameField.text phone:_phoneField.text];
    
    // 通知联系人控制器接收数据
    if([_delegate respondsToSelector:@selector(addVcaddVc:didAddContact:)]) {
        [_delegate addVc:self didAddContact:contact];
    }
    
//    _contactVc.contact = c; // 给 _contactVc 赋值
    
    // 回到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
}

@end






