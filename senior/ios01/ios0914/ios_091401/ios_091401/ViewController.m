//
//  ViewController.m
//  ios_091401
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+X.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage xImage:[UIImage imageNamed:@"doubi.jpg"] withBorderWidth:9 withBorderColor:UIColor.cyanColor];
    
    
//    self.imageView.image = [UIImage xImageNamed:@"doubi.jpg" withBorderWidth:7 withBorderColor:UIColor.orangeColor];
    
}

@end


