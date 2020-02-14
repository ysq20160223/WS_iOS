//
//  ViewController.m
//  ios_091602
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(50, 50, 100, 100);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"a_li"].CGImage;
    
    
}

@end


