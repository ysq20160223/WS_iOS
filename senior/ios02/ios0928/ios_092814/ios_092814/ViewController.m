//
//  ViewController.m
//  ios_092814
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end



@implementation ViewController

- (IBAction)btnClick:(UIButton *)sender {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"global queue : %@", [NSThread currentThread]);
        
        // 1
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/img/bd_logo1.png"];
        
        // 2
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 3
        UIImage *image = [UIImage imageWithData:data];
        
        // ---
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"main queue : %@", [NSThread currentThread]);
            
            self.imageView.image = image;
        });
    });
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


@end


