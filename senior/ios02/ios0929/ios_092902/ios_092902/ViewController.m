//
//  ViewController.m
//  ios_092902
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Tools.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Tools *t1 = [[Tools alloc] init];
    Tools *t2 = [[Tools alloc] init];
    NSLog(@"t1: %@, t2: %@", t1, t2);
//    NSLog(@"t1:%@, t2:%@, t3:%@", [t1 copy] , [t1 mutableCopy], [Tools shareTools]);
}

@end


