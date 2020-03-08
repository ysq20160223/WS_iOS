//
//  ViewController.m
//  ios_101206
//
//  Created by Apple on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "NSString+Hash.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *src;

@property (weak, nonatomic) IBOutlet UITextView *encode;

@end



@implementation ViewController

- (IBAction)md5:(UIButton *)sender {
    NSString *src = self.src.text;
    
    if (nil != src && src.length > 0) {
        self.encode.text = [self.src.text md5String];
    } else {
        self.encode.text = @"src is empty";
    }
    
}

@end


