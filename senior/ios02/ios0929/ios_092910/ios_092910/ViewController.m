//
//  ViewController.m
//  ios_092910
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *ivFirst;
@property (weak, nonatomic) IBOutlet UIImageView *ivSecond;

//
@property (strong, nonatomic) UIImage *imageFirst;
@property (strong, nonatomic) UIImage *imageSecond;

@end



@implementation ViewController

- (IBAction)download2:(UIButton *)sender {
    // 1
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"]; // 2.1
        NSData *data = [NSData dataWithContentsOfURL:url]; // 2.2
        self.imageFirst = [UIImage imageWithData:data]; // 2.3
        
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/img/bd_logo1.png"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        self.imageSecond = [UIImage imageWithData:data];
    }];
    
    NSBlockOperation *dependencyOp = [NSBlockOperation blockOperationWithBlock:^{
        UIGraphicsBeginImageContext(CGSizeMake(375, 402));
        
        [self.imageFirst drawInRect:CGRectMake(0, 0, 375, 179)];
        [self.imageSecond drawInRect:CGRectMake(0,179, 375, 223)];
        
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.ivSecond.image = image;
        }];
    }];
    
    [dependencyOp addDependency:op1];
    [dependencyOp addDependency:op2];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:dependencyOp];
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
            self.ivFirst.image = image;
        }];
    }];
}

@end


