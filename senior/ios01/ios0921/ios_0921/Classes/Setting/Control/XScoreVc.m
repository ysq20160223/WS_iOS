//
//  XScoreVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XScoreVc.h"

#import "XGroupItem.h"

//
#import "XSettingSwitchItem.h"
#import "XSettingItem.h"

@interface XScoreVc ()

@end



@implementation XScoreVc

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
    XGroupItem *group = XGroupItem.alloc.init;
    group.footerTitle = @"开启后, 当投注或关注的比赛开始, 进球和结束时, 会自动发送推送消息提醒";
    
    XSettingSwitchItem *item = [XSettingSwitchItem itemWithImage:nil title:@"Push Follow Match"];
    group.itemArray = @[item];
    
    [self.groupArray addObject:group];
}

// 第1组数据
- (void)setUpGroup1 {
    XGroupItem *group = XGroupItem.alloc.init;
    group.headerTitle = @"只在以下时间段接收比分直播推送";
    
    XSettingItem *item = [XSettingItem itemWithImage:nil title:@"Start Time" subTitle:@"00:00:00"];
    group.itemArray = @[item];
    
    [self.groupArray addObject:group];
}

// 第2组数据
- (void)setUpGroup2 {
    XGroupItem *group = XGroupItem.alloc.init;
    
    XSettingItem *item = [XSettingItem itemWithImage:nil title:@"End Time" subTitle:@"23:59:59"];
    group.itemArray = @[item];
    
    [self.groupArray addObject:group];
}


// 测试数据
- (void)setUpGroupTest {
    XGroupItem *group = XGroupItem.alloc.init;
    
    XSettingItem *item = [XSettingItem itemWithImage:nil title:@"Test Data" subTitle:@"23:59:59"];
    group.itemArray = @[item];
    
    // 注意
    // block机制 : block 会把里面代码块的所有强指针都强引用
    // block 尽量少使用self, 容易造成循环引用
    // block 尽量少使用下划线直接访问成员属性
    // typeof(参数) 会自动识别参数的类型
    __weak typeof(self) weakSelf = self; // 解决循环引用问题
    item.operationBlock = ^(NSIndexPath *indexPath){
        // 循环引用问题
        // 弹出键盘
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//        UITextField *textField = UITextField.alloc.init;
//        [textField becomeFirstResponder];
//        [cell addSubview:textField];
        
        
        // 解决循环引用问题
        // 获取点击 cell
        UITableViewCell *cell = [weakSelf.tableView cellForRowAtIndexPath:indexPath];
        UITextField *textField = UITextField.alloc.init;
        [textField becomeFirstResponder];
        [cell addSubview:textField];
    };
    
    [self.groupArray addObject:group];
}

// 对象即将销毁会调用
- (void)dealloc {
    NSLog(@"");
}

@end


