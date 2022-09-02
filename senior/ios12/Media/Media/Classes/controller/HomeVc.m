//
//  HomeVc.m
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "HomeVc.h"
#import "AudioVc.h"

@interface HomeVc ()

@end



@implementation HomeVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}


- (IBAction)onClickAudio:(UIButton *)sender {
    XLog
    [self.navigationController pushViewController:AudioVc.alloc.init animated:YES];
}

@end


