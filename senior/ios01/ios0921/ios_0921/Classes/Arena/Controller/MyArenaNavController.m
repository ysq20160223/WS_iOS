//
//  MyArenaNavController.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyArenaNavController.h"

@interface MyArenaNavController ()

@end



@implementation MyArenaNavController

+ (void)load {
    // 获取当前类下的所有导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    UIImage *img = [UIImage imageNamed:@"NLArenaNavBar64"];
    img = [img stretchableImageWithLeftCapWidth:img.size.width * .5 topCapHeight:img.size.height * .5];
    
    [navBar setBackgroundImage:img forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
