//
//  ViewController.m
//  ios_091711
//
//  Created by Apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "ComposeVC.h"

#import "MenuItem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)btnClick:(UIButton *)sender {
    ComposeVC *vc = [[ComposeVC alloc] init];
    
    MenuItem *item1 = [MenuItem itemWithTitle:@"Review" image:[UIImage imageNamed:@"tabbar_compose_review"]];
    MenuItem *item2 = [MenuItem itemWithTitle:@"More" image:[UIImage imageNamed:@"tabbar_compose_more"]];
    MenuItem *item3 = [MenuItem itemWithTitle:@"Camera" image:[UIImage imageNamed:@"tabbar_compose_camera"]];
    MenuItem *item4 = [MenuItem itemWithTitle:@"Photo" image:[UIImage imageNamed:@"tabbar_compose_photo"]];
    MenuItem *item5 = [MenuItem itemWithTitle:@"Idea" image:[UIImage imageNamed:@"tabbar_compose_idea"]];
    MenuItem *item6 = [MenuItem itemWithTitle:@"Lbs" image:[UIImage imageNamed:@"tabbar_compose_lbs"]];
    
    vc.itemArray = @[item1, item2, item3, item4, item5, item6];
    
    [self presentViewController:vc animated:YES completion:nil];
    
}


@end


