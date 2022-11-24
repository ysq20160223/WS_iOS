//
//  LoginVc.m
//  ios_04
//
//  Created by Apple on 2017/8/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
 传值
 1, 接收方要有一个属性去接收
 2, 在传递中需要拿到接收方
 
 顺传
 1, 来源控制器传值给目的控制器
 
 逆传 : 代理
 1, 接收方要有属性接收
 2, 传递方声明代理协议和属性
 3, 在来源控制器跳转到目的控制器, 给目的控制器的代理属性赋值
 4, 在恰当的时候(点击添加), 拿到代理传值
 
 */

#import "LoginVc.h"
#import "LoginAnimView.h"
#import "ContactsVc.h"
#import "MBProgressHUD+XMG.h"

@interface LoginVc () <UITextFieldDelegate>

@property (weak, nonatomic) LoginAnimView *loginAnimView;
@property (weak, nonatomic) IBOutlet UIView *animContentView;

@property (weak, nonatomic) IBOutlet UITextField *accountField; // 账号
@property (weak, nonatomic) IBOutlet UITextField *pwdField; // 密码

@property (weak, nonatomic) IBOutlet UIButton *loginBtn; // 登陆按钮
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch; // 记住密码控件
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch; // 自动登录控件


//
- (IBAction)rememberPassword:(UISwitch *)sender; // 点击记住密码
- (IBAction)autoLogin:(UISwitch *)sender; // 点击自动登录

- (IBAction)clickLogin:(UIButton *)sender; // 点击登陆按钮

@end



@implementation LoginVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LoginAnimView *animView = [LoginAnimView loginAnimView];
    self.loginAnimView = animView;
    [self.animContentView addSubview:animView];
    
    // 设置文本框代理, 监听开始编辑
    _accountField.delegate = self;
    _pwdField.delegate = self;
    
    // 及时监听文本框输入
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
}

// 文本改变
- (void)textChange {
    //    NSLog(@"%@", _accountField.text);
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
}

// 文本框开始输入
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.frame.origin.y == _accountField.frame.origin.y) {
        [self.loginAnimView startAnim:NO];
    } else {
        [self.loginAnimView startAnim:YES];
    }
}

// 记住密码
- (IBAction)rememberPassword:(UISwitch *)sender {
    if (sender.on == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];
    }
    [self.view endEditing:YES];
}

// 自动登录
- (IBAction)autoLogin:(UISwitch *)sender {
    if (sender.on == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];
    }
    [self.view endEditing:YES];
}

// 生命周期方法, 退出键盘
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES]; // 退出键盘
}

// 点击登陆按钮
- (IBAction)clickLogin:(UIButton *)sender {
    [self.view endEditing:YES]; // 退出键盘
    
    // 弹出蒙版, 在登陆期间, 不允许用户交互
    [MBProgressHUD showMessage:@"Login..."];
    
    // 延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD]; // 隐藏蒙版
        
        // 手动跳转
        if ([_accountField.text isEqualToString:@"yy"] && [_pwdField.text isEqualToString:@"123"]) {
            [self performSegueWithIdentifier:@"login2Contacts" sender:nil];
            
            // 代码跳转
//            ContactsViewController *contactsVc = [[ContactsViewController alloc] init];
//            [self.navigationController pushViewController:contactsVc animated:YES];
//            contactsVc.navigationItem.title = [NSString stringWithFormat:@"%@ - Contacts", _accountField.text];
        } else {
            [MBProgressHUD showError:@"Account Or Password Error!"];
        }
    });
    
    
    // 090910
    // 1, 根据标示符去 storyboard 中查找那根线, 创建 segue 对象
    // 2, 设置 segue 来源控制器 segue.sourceVc = self;
    // 3, 设置目的控制器, 设置 segue 的目的控制器
    // 4, 通知来源控制器, 线准备好了, 可以跳转, 调用 [self prepareForSegue:segue:nil]
    // 5, [segue perform] 跳转
    
    // perform 方法底层执行
    // 1, 获取导航控制器, 根据 story.navigationController
    // 2, push self.navigationController push:segue.destVc
    
    // 创建目的控制器, 根据 storyboard 描述创建
}

// 跳转到 ContactsViewController 之前的准备操作, 传值 segue: [ˈsegweɪ]
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue: %@, sender: %@", segue, sender);
    
    ContactsVc *contactsVc = segue.destinationViewController;
    
    // 传值 - 方法1
    //    contactsVc.account = _accountField.text;
    
    // 方法2
    contactsVc.navigationItem.title = [NSString stringWithFormat:@"%@ - Contacts", _accountField.text];
}

@end


