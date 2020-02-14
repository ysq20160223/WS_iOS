//
//  ViewController.m
//  ios_092903
//
//  Created by Apple on 2017/8/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Tools.h"

#import "FileTool.h"

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Tools *t1 = [[Tools alloc] init];
    [t1 retain];
    [t1 retain];
    [t1 release];
    
    Tools *t2 = [Tools new];
    [t2 release];

//    NSLog(@"t1 retainCount=%zd --- t2 retainCount=%zd", [t1 retainCount], [t2 retainCount]);
    NSLog(@"%@, %@, %@", t1, t2, [Tools shareTools]);
    
    //
    FileTool *fileTool1 = [[FileTool alloc] init];
    FileTool *fileTool2 = [FileTool new];
    NSLog(@"%@, %@, %@", fileTool1, fileTool2, [FileTool shareFileTool]);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#if __has_feature(objc_arc)
    NSLog(@"ARC");
#else
    NSLog(@"MRC");
#endif
    
}


@end


