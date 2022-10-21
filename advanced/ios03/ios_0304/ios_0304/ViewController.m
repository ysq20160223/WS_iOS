//
//  ViewController.m
//  ios_0304
//
//  Created by Apple on 2017/7/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *personArray;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger screenW = self.view.frame.size.width;
    NSInteger screenH = self.view.frame.size.height;
    
    self.toolbar.frame = CGRectMake(0, kStatusBarH, self.view.frame.size.width, self.toolbar.frame.size.height);
    
    self.tableView.frame =CGRectMake(0, self.toolbar.frame.size.height + 1 * kStatusBarH, screenW, screenH - self.toolbar.frame.size.height - kStatusBarH);

    self.personArray = [NSMutableArray array];
    for(int i = 0; i < 21; i++) {
        Person *person = Person.alloc.init;
        person.name = [NSString stringWithFormat:@"Person - %d", i];
        person.phone = [NSString stringWithFormat:@"%.3d", i];
        [self.personArray addObject:person];
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell) {
        cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    Person *person = self.personArray[indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.phone;
    return cell;
}


// 实现该方法默认实现 排序功能
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSLog(@"sourceIndexPath:%ld, destinationIndexPath: %ld", sourceIndexPath.row, destinationIndexPath.row);
    Person *person = self.personArray[sourceIndexPath.row]; // 1, 先取出要拖动的模型数据
    [self.personArray removeObjectAtIndex:sourceIndexPath.row]; // 2, 删除之前的位置的模型数据
    [self.personArray insertObject:person atIndex:destinationIndexPath.row]; // 3, 将 person 插入到最新的位置
}


// PROJECT -> xxx -> info -> Localizations 语言
// 实现该方法默认实现 右滑显示删除
// 点击删除按钮 - 默认是删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"editingStyle: %ld", editingStyle);
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        [self.personArray removeObjectAtIndex:indexPath.row]; // 1, 删除模型数据
        
        //    [tableView reloadData]; // 2
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - UITableViewDelegate

// 进入编辑模式
- (IBAction)compose:(UIBarButtonItem *)sender {
    [UIView animateWithDuration:2 animations:^{
//        self.tableView.editing = !self.tableView.isEditing; // 进入编辑模式
        [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    }];
}

@end


