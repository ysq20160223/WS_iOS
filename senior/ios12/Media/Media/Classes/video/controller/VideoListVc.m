//
//  VideoListVc.m
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "VideoListVc.h"

#import "RotationModeVc.h"


@interface VideoListVc ()

@end



@implementation VideoListVc

- (void)viewWillAppear:(BOOL)animated {
//    XLog
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)onClickVideo:(UIButton *)sender {
    [self.navigationController pushViewController:RotationModeVc.alloc.init animated:YES];
}
@end


