//
//  TwoViewController.m
//  ios_05
//
//  Created by Apple on 08/02/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}


- (IBAction)pop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end


