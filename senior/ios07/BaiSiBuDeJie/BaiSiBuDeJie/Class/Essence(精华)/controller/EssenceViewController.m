//
//  EssenceNavController.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/17.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "EssenceViewController.h"
#import "UIBarButtonItem+X.h"
#import "RecommendViewController.h"

@interface EssenceViewController ()

@end



@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    XLog
    self.view.backgroundColor = XColor(0x00, 0x88, 0xff);
//    self.navigationItem.title = @"essence";
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" highlightImage:@"MainTagSubIconClick" tartget:self action:@selector(navItemLeftBtnViewClick:)];
    
}

- (void)navItemLeftBtnViewClick:(UIButton *)btn {
//    NSLog(@"btn: %@", btn);
    
    RecommendViewController *viewController = [[RecommendViewController alloc] init];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

@end


