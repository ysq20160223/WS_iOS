//
//  LoginRegisterController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/21.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LoginRegisterController.h"
#import "UIView+X.h"

@interface LoginRegisterController ()

@property (weak, nonatomic) IBOutlet UIButton *loginRegisterBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerLoginViewLeading;

@end



@implementation LoginRegisterController

- (IBAction)close:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerAccount:(UIButton *)sender {
//    NSLog(@"constant: %f", self.centerLoginViewLeading.constant);
    [self.view endEditing:YES];
    
    if (0 == self.centerLoginViewLeading.constant) { // 登录界面
        self.centerLoginViewLeading.constant = -self.view.xWidth;
        [sender setTitle:@"Had Account?" forState:UIControlStateNormal];
    } else { // 注册界面
        self.centerLoginViewLeading.constant = 0;
        [sender setTitle:@"Register" forState:UIControlStateNormal];
    }
    
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    self.loginRegisterBtn.layer.cornerRadius = 5;
//    self.loginRegisterBtn.layer.masksToBounds = YES;
    
//    [self.loginRegisterBtn setValue:@10 forKey:@"layer.cornerRadius"];
//    [self.loginRegisterBtn setValue:@YES forKey:@"layer.masksToBounds"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self close:nil];
    [self.view endEditing:YES];
}

@end


