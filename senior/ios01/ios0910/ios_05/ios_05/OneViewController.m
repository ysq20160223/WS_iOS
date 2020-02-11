//
//  OneViewController.m
//  ios_05
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

- (IBAction)dismiss:(UIButton *)sender;

@end




@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)dismiss:(UIButton *)sender {
    NSLog(@"");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


