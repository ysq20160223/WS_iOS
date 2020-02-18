//
//  ViewController.m
//  ios_100912
//
//  Created by Apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Main.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)unzipFile:(UIButton *)sender {
    [Main unzipFileAtPath:@"/Users/Apple/Desktop/zipFile.zip" toDestination:@"/Users/Apple/Desktop/unzipFile"];
    
}


- (IBAction)zipDir:(UIButton *)sender {
    [Main createZipFileAtPath:@"/Users/Apple/Desktop/zipDir.zip" withContentsOfDirectory:@"/Users/Apple/Desktop/demo"];
    
}


- (IBAction)zipFile:(UIButton *)sender {
    NSArray *array = @[
                       @"/Users/Apple/Desktop/qin_s_moon/Temp/t_001.jpg",
                       @"/Users/Apple/Desktop/qin_s_moon/Temp/t_004.jpg",
                       @"/Users/Apple/Desktop/qin_s_moon/Temp/t_006.jpg"];
    [Main createZipFileAtPath:@"/Users/Apple/Desktop/zipFile.zip" withFilesAtPaths:array];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

@end



