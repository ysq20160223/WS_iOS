//
//  OneViewController.m
//  ios_05
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OneVc.h"

@interface OneVc ()

- (IBAction)dismiss:(UIButton *)sender;

@end



@implementation OneVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)dismiss:(UIButton *)sender {
    XLog
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


