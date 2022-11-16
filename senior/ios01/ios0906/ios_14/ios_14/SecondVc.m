//
//  TwoViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SecondVc.h"
#import "ThirdVc.h"

@interface SecondVc ()

@end



@implementation SecondVc

- (void)viewDidLoad {
    self.navigationItem.title = @"Second";
    
    NSLog(@"%@", self.navigationController.childViewControllers);
}

- (IBAction)jump2Third:(id)sender {
    ThirdVc *thirdViewController = [[ThirdVc alloc] init];
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
//    NSLog(@"%@", self.navigationController.childViewControllers);

}

@end
