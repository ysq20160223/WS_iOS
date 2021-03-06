//
//  ViewController.m
//  ios_11
//
//  Created by Apple on 2017/8/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

/*
    01, xml 属性列表(plist)归档 : 无法存储自定义对象
    02, Preference(偏好设置)
    03, NSKeyedArchiver归档(NSCoding)
    04, SQLite3
    05, Core Data
 */

#import "ViewController.h"

@interface ViewController ()

- (IBAction)plistWtiter:(id)sender;
- (IBAction)plistRead:(id)sender;

//
- (IBAction)prefersWrite:(id)sender;
- (IBAction)prefersRead:(id)sender;

@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}


// --------------------- Plist
- (IBAction)plistWtiter:(id)sender {
    // plist 存储本质, 生成一个 plist文件
    // (数组, 字典)
    NSArray *array = @[@"123", @456];
    
//    NSString *homePath = NSHomeDirectory();
//    NSLog(@"homePath : %@", homePath);
    
    
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"cachesPath: %@", cachesPath);
    
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"array.plist"];
    
    // 文件存储路径, 应用沙盒的某个文件夹中
    [array writeToFile:filePath atomically:YES];
    
}

- (IBAction)plistRead:(id)sender {
    NSString *cachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [cachesPath stringByAppendingPathComponent:@"array.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"array: %@", array);
}



// --------------------- Perferences : 进行键值对存储
- (IBAction)prefersWrite:(id)sender {
    // path : ~/Library/Preferences/mac.ios-11.plist
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"112233" forKey:@"num"];
    [defaults setBool:YES forKey:@"isOn"];
}

- (IBAction)prefersRead:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *num = [defaults objectForKey:@"num"];
    BOOL isOn = [defaults boolForKey:@"isOn"];
    NSLog(@"num: %@, isOn: %id", num, isOn);
}


@end


