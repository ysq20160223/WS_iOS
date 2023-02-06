//
//  ViewController.m
//  ios_091603
//
//  Created by Apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    UIView 当中的 center 就是 layout 当中 position
 
 */

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = CALayer.layer;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = UIColor.cyanColor.CGColor;
    
    layer.position = CGPointMake(self.view.bounds.size.width * .5, self.view.bounds.size.height * .5);
    
    layer.anchorPoint = CGPointMake(.0, .0);
    
    [self.view.layer addSublayer:layer];
    
}

@end


