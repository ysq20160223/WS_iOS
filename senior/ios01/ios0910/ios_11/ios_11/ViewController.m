//
//  ViewController.m
//  ios_11
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "PopButton.h"

@interface ViewController () {
    
}

@end



@implementation ViewController

- (IBAction)btnClick:(PopButton *)sender {
    
    // 弹出对话框
    UIButton *btnDialogView = sender.btnDialogView;
    
    if (nil == btnDialogView) {
        btnDialogView = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btnDialogView setBackgroundImage:[UIImage imageNamed:@"abx"] forState:UIControlStateNormal];
        [btnDialogView setBackgroundImage:[UIImage imageNamed:@"ab9"] forState:UIControlStateHighlighted];
        btnDialogView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
        [btnDialogView sizeToFit];
        btnDialogView.center = CGPointMake(btnDialogView.bounds.size.width * .5, -btnDialogView.bounds.size.height * .5);
        
        sender.btnDialogView = btnDialogView;
        
        [sender addSubview:btnDialogView];
    } else {
        btnDialogView.hidden = !btnDialogView.hidden;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


@end


