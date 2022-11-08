//
//  ViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "_ViewController.h"

@interface _ViewController ()

@end




@implementation _ViewController

//- (UIView *)view {
//    if(nil == _view) {
//        [self loadView];
//        [self viewDidLoad];
//    }
//    return _view;
//}


- (void)loadView {
    XLog
    
    UIView *v = [UIView.alloc initWithFrame:UIScreen.mainScreen.bounds];
    v.backgroundColor = UIColor.magentaColor;
    self.view = v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.brownColor;
    XLog
}


@end


