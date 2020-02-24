//
//  MyDiscoverViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XDiscoverViewController.h"

@interface XDiscoverViewController ()

@end



@implementation XDiscoverViewController

+ (instancetype)instance {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:[NSString stringWithFormat:@"%@", [self class]] bundle:nil];
    return [sb instantiateInitialViewController];
}


- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    NSLog(@"");
}


@end


