//
//  ViewController.m
//  ios_092910
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

//
@property (strong, nonatomic) UIImage *imageBD;
@property (strong, nonatomic) UIImage *imageQMoon;

@end



@implementation ViewController

- (IBAction)download2:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"]; // 2.1
        NSData *data = [NSData dataWithContentsOfURL:url]; // 2.2
        self.imageBD = [UIImage imageWithData:data]; // 2.3
        
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://cache.qinsmoon.com/a/qinsmoon/downloads/wallpaper/2016-02-29/e06143824ed6bc953f6668aca4422a5a.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.imageQMoon = [UIImage imageWithData:data];
    }];
    
    NSBlockOperation *combile = [NSBlockOperation blockOperationWithBlock:^{
        UIGraphicsBeginImageContext(CGSizeMake(375, 402));
        
        [self.imageBD drawInRect:CGRectMake(0, 0, 375, 179)];
        [self.imageQMoon drawInRect:CGRectMake(0,179, 375, 223)];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        //
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView2.image = image;
        }];
    }];
    
    [combile addDependency:op1];
    [combile addDependency:op2];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:combile];
}


//
- (IBAction)download:(UIButton *)sender {
    
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    [queue addOperationWithBlock:^{
        // 2.1
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
        
        // 2.2
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 2.3
        UIImage *image = [UIImage imageWithData:data];
        
        // 3
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
        
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


@end


