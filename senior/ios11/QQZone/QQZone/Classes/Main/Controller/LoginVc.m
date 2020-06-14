//
//  MainVc.m
//  QQZone
//
//  Created by Apple on 2020/6/6.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LoginVc.h"

#import "HomeVc.h"
#import "UIView+X.h"

// category
#import "UIImage+X.h"
#import "UITextField+X.h"

// third frame
#import <MBProgressHUD.h>


@interface LoginVc () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *vLogin;
@property (weak, nonatomic) IBOutlet UITextField *tfAccount;
@property (weak, nonatomic) IBOutlet UITextField *tfPwd;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end



@implementation LoginVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initView];
    
    self.tfAccount.delegate = self;
    self.tfPwd.delegate = self;
    
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    NSLog(@"%@", NSStringFromCGSize(size));
//}

#pragma mark - init
- (void)initView {
    [self.btnLogin setBackgroundImage:[UIImage imageWithColor:XColor(35, 35, 35)] forState:UIControlStateNormal];
    [self.btnLogin setBackgroundImage:[UIImage imageWithColor:XColor(41, 41, 41)] forState:UIControlStateHighlighted];
    
    self.tfAccount.xPlacehoderColor = XColor(0x7f, 0x7f, 0x7f);
    self.tfPwd.xPlacehoderColor = XColor(0x7f, 0x7f, 0x7f);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - click start
- (IBAction)onClickLogin:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSString *account = self.tfAccount.text;
    NSString *pwd = self.tfPwd.text;
    
    if (0 == account.length || 0 == pwd.length) {
        [self showAlert:@"Account or Pwd not be empty"];
        return;
    }
    
    if ([@"123" isEqualToString:account] && [@"123" isEqualToString:pwd]) {
        self.view.window.rootViewController = [[HomeVc alloc] init];
    } else {
        [self showAlert:@"Account or Pwd is ERROR"];
    }
}
#pragma mark - click end


- (void)showAlert:(NSString *)msg {
    //
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login Failure" message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *certainAction = [UIAlertAction actionWithTitle:@"Certain" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:certainAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    //
    CAKeyframeAnimation *keyFrameAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    keyFrameAnim.values = @[@-10, @0, @10, @0];
    keyFrameAnim.repeatCount = 3;
    keyFrameAnim.duration = 0.1;
    [self.vLogin.layer addAnimation:keyFrameAnim forKey:nil];
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.tfAccount) {
        [self.tfPwd becomeFirstResponder];
    } else {
        [self onClickLogin:nil];
    }
    return YES;
}


#pragma mark -
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark -
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark -
- (void)dealloc {
    XLog
}

@end


