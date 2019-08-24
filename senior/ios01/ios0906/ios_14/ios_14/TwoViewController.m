//
//  TwoViewController.m
//  ios_14
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TwoViewController.h"
#import "ThirdViewController.h"

@interface TwoViewController ()

@end



@implementation TwoViewController


- (IBAction)jump2Third:(id)sender {
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdViewController animated:YES];
    
//    NSLog(@"%@", self.navigationController.childViewControllers);

}

@end
