//
//  ViewController.m
//  ios_04
//
//  Created by Apple on 2017/7/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    UIApplication
 */

#import "ViewController.h"

#import "Person.h"

@interface ViewController ()

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIApplication *application = [[UIApplication alloc] init]; // 单例会报错
    NSLog(@"application: %@", [UIApplication sharedApplication]);
    
//    Person *person = [[Person alloc] init];
    Person *person = [Person sharePerson];
    NSLog(@"person: %@", person);
}

@end




