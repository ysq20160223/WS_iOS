//
//  MyScoreViewController.m
//  ios_0921
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MyScoreViewController.h"

#import "MyGroupItem.h"

//
#import "MySettingSwitchItem.h"
#import "MySettingItem.h"

@interface MyScoreViewController ()

@end



@implementation MyScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpGroup0]; // 第0组数据
    
    [self setUpGroup1]; // 第1组数据
    
    [self setUpGroup2]; // 第2组数据
    
    [self setUpGroupTest]; // 测试数据
    [self setUpGroupTest]; // 测试数据
    [self setUpGroupTest]; // 测试数据
    
}

// 第0组数据
- (void)setUpGroup0 {
    MyGroupItem *group = [[MyGroupItem alloc] init];
    group.footerTitle = @"开启后, 当投注或关注的比赛开始, 进球和结束时, 会自动发送推送消息提醒";
    
    MySettingSwitchItem *item = [MySettingSwitchItem itemWithImage:nil title:@"Push Follow Match"];
    group.items = @[item];
    
    [self.groups addObject:group];
}

// 第1组数据
- (void)setUpGroup1 {
    MyGroupItem *group = [[MyGroupItem alloc] init];
    group.headerTitle = @"只在以下时间段接收比分直播推送";
    
    MySettingItem *item = [MySettingItem itemWithImage:nil title:@"Start Time" subTitle:@"00:00:00"];
    group.items = @[item];
    
    [self.groups addObject:group];
}

// 第2组数据
- (void)setUpGroup2 {
    MyGroupItem *group = [[MyGroupItem alloc] init];
    
    MySettingItem *item = [MySettingItem itemWithImage:nil title:@"End Time" subTitle:@"23:59:59"];
    group.items = @[item];
    
    [self.groups addObject:group];
}


// 测试数据
- (void)setUpGroupTest {
    MyGroupItem *group = [[MyGroupItem alloc] init];
    
    MySettingItem *item = [MySettingItem itemWithImage:nil title:@"Test Data" subTitle:@"23:59:59"];
    group.items = @[item];
    
    // 注意
    // block机制 : block 会把里面代码块的所有强指针都强引用
    // block 尽量少使用self, 容易造成循环引用
    // block 尽量少使用下划线直接访问成员属性
    __weak typeof(self) weakSelf = self; // 解决循环引用问题
    item.operationBlock = ^(NSIndexPath *indexPath){
        // 获取点击 cell
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        
        // 弹出键盘
        UITextField *textField = [[UITextField alloc] init];
        [textField becomeFirstResponder];
        //        [self.view addSubview:textField];
        
        // 键盘处理
        [cell addSubview:textField];
    };
    
    [self.groups addObject:group];
}

// 对象即将销毁会调用
- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end


