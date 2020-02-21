//
//  ViewController.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "ComposeVC.h"

#import "MenuBean.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)btnClick:(UIButton *)sender {
    ComposeVC *vc = [[ComposeVC alloc] init];
    
    MenuBean *reviewMenuBean = [MenuBean itemWithTitle:@"Review" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    MenuBean *moreMenuBean = [MenuBean itemWithTitle:@"More" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    MenuBean *cameraMenuBean = [MenuBean itemWithTitle:@"Camera" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    MenuBean *photoMenuBean = [MenuBean itemWithTitle:@"Photo" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    MenuBean *ideaMenuBean = [MenuBean itemWithTitle:@"Idea" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    MenuBean *lbsMenuBean = [MenuBean itemWithTitle:@"Lbs" image:[UIImage imageNamed:@"tabbar_compose_lbs"]];
    
    vc.menuBeanArray = @[reviewMenuBean, moreMenuBean, cameraMenuBean, photoMenuBean, ideaMenuBean, lbsMenuBean];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end


