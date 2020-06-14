//
//  MoodVc.m
//  QQZone
//
//  Created by Apple on 2020/6/13.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MoodVc.h"

@interface MoodVc ()

@end

@implementation MoodVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.navigationItem.title = @"Mood";
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Right" style:UIBarButtonItemStyleDone target:self action:nil];
    
    
    //
    UISegmentedControl *segController = [[UISegmentedControl alloc] initWithItems:@[@"All", @"Focus", @"Verify"]];
    segController.selectedSegmentIndex = 0;
    segController.tintColor = [UIColor blueColor];
    self.navigationItem.titleView = segController;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
