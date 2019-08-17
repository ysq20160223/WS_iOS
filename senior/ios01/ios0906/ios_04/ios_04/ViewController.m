//
//  ViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end




@implementation ViewController

//- (UIView *)view {
//    if(nil == _view) {
//        [self loadView];
//        [self viewDidLoad];
//    }
//    return _view;
//}


- (void)loadView {
    NSLog(@"");
    
    UIView *v = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    v.backgroundColor = [UIColor lightGrayColor];
    self.view = v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"");
}



@end





