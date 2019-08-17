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
    
    ThirdViewController *thirdVc = [[ThirdViewController alloc] init];
    
    [self.navigationController pushViewController:thirdVc animated:YES];
    
    
//    NSLog(@"%@", self.navigationController.childViewControllers);

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
