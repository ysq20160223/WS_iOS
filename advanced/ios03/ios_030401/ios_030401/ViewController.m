//
//  ViewController.m
//  ios_030401
//
//  Created by Apple on 2017/7/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *_persons;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _persons = [NSMutableArray array];
    
    for(int i = 0; i < 21; i++) {
        Person *p = [[Person alloc] init];
        p.name = [NSString stringWithFormat:@"Person - %d", i];
        p.phone = [NSString stringWithFormat:@"151 5555 66%.2d", i];
        [_persons addObject:p];
    }
    
}

// 1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _persons.count;
}

// 2
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    Person *p = _persons[indexPath.row];
    
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.phone;
    
    return cell;
}

// 行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

// 进入编辑模式
- (IBAction)trash:(UIBarButtonItem *)sender {
//    self.tableView.editing = YES; // 进入编辑模式
//    [self.tableView setEditing:YES animated:NO];
    
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    
}

// 点击删除按钮 - 默认是删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle != UITableViewCellEditingStyleDelete) return;
    
    [_persons removeObjectAtIndex:indexPath.row]; // 1, 删除模型数据
    
//    [tableView reloadData]; // 2,
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

// 排序功能
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    Person *p = _persons[sourceIndexPath.row]; // 1, 取出要拖动的模型数据
    
    [_persons removeObjectAtIndex:sourceIndexPath.row]; // 2, 删除之前的位置的模型数据
    
    [_persons insertObject:p atIndex:destinationIndexPath.row]; // 3, 将 p 插入到最新的位置
}

@end




