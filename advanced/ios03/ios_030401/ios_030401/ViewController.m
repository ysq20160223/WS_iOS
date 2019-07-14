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
    NSMutableArray *_personArray;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect toolbarRect = CGRectMake(0, statusRect.size.height, self.view.frame.size.width, _toolbar.frame.size.height);
    _toolbar.frame = toolbarRect;
    
    CGRect tableViewRect = CGRectMake(0, toolbarRect.size.height + 2 * statusRect.size.height, self.view.frame.size.width, self.view.frame.size.height - toolbarRect.size.height - statusRect.size.height);
    _tableView.frame = tableViewRect;
    
    
    
    _personArray = [NSMutableArray array];
    
    for(int i = 0; i < 21; i++) {
        Person *p = [[Person alloc] init];
        p.name = [NSString stringWithFormat:@"Person - %d", i];
        p.phone = [NSString stringWithFormat:@"151 5566 77%.2d", i];
        [_personArray addObject:p];
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _personArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    Person *p = _personArray[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.phone;
    
    return cell;
}

// 实现该方法默认实现排序功能
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    NSLog(@"sourceIndexPath:%ld, destinationIndexPath: %ld", sourceIndexPath.row, destinationIndexPath.row);
    Person *p = _personArray[sourceIndexPath.row]; // 1, 取出要拖动的模型数据
    [_personArray removeObjectAtIndex:sourceIndexPath.row]; // 2, 删除之前的位置的模型数据
    [_personArray insertObject:p atIndex:destinationIndexPath.row]; // 3, 将 p 插入到最新的位置
}


// 默认实现右滑显示删除
// 点击删除按钮 - 默认是删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(editingStyle != UITableViewCellEditingStyleDelete) {
        return;
    }
    
    [_personArray removeObjectAtIndex:indexPath.row]; // 1, 删除模型数据
    
    //    [tableView reloadData]; // 2
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 进入编辑模式
- (IBAction)trash:(UIBarButtonItem *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
//    self.tableView.editing = YES; // 进入编辑模式
//    [self.tableView setEditing:YES animated:NO];
    
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    
    [UIView commitAnimations];
}

@end





