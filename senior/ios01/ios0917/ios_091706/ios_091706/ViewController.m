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
    
//    NSLog(@"%@", [self.view.layer class]);
    
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    //
    repL.instanceRedOffset -= .1;
    repL.instanceGreenOffset -= .1;
    repL.instanceBlueOffset -= .1;
    
    repL.instanceAlphaOffset -= .1;
    
    
}

@end


