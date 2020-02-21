//
//  ViewController.m
//  ios_091706
//
//  Created by Apple on 2017/8/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@", [self.view.layer class]);
    
    CAReplicatorLayer *repLayer = (CAReplicatorLayer *)self.view.layer;
    repLayer.instanceCount = 2;
    
    repLayer.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    //
    repLayer.instanceRedOffset -= .1;
    repLayer.instanceGreenOffset -= .1;
    repLayer.instanceBlueOffset -= .1;
    repLayer.instanceAlphaOffset -= .1;
}

@end


