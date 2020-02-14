//
//  ViewController.m
//  ios_091707
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "VCView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet VCView *vcView;

@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)start:(UIButton *)sender {
    [self.vcView start];
    
}

- (IBAction)reDraw:(UIButton *)sender {
    [self.vcView reDraw];
    
}



@end



