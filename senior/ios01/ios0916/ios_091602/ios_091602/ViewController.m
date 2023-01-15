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
    
    //
    CALayer *layer = CALayer.layer;
    [self.view.layer addSublayer:layer];
    
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = UIColor.cyanColor.CGColor;
    layer.contents = (id)[UIImage imageNamed:@"a_li"].CGImage;
    
    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
}

@end


