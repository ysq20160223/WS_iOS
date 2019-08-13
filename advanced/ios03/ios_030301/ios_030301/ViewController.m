//
//  ViewController.m
//  ios_030301
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    UITableView *_tableView;
    
    NSMutableArray *_mutableArray;
}

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    
    _mutableArray = [NSMutableArray array];
    for (int i = 0; i< 100; i++) {
        [_mutableArray addObject:[NSString stringWithFormat:@"Row: %d", i]];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mutableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"cell for row at index path : %ld", indexPath.row);
    
    static NSString *ID = @"cell";
    
    // 1, 从缓存池中取出可循环利用的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    // 没有复用
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 2, 如果缓存池中没有可循环利用的 cell
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = _mutableArray[indexPath.row];
    
    NSLog(@"cell: %p, row: %ld", cell, indexPath.row);
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self textField:indexPath];
    
//    [self defaultCancel];
//    [self actionSheet];
}


- (void)actionSheet {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:(UIAlertControllerStyleActionSheet)];
    
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"title" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"destructiveAction");
    }];

    
    [alertController addAction:destructiveAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


// **********************************************************
- (void)textField:(NSIndexPath *)indexPath {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.text = _mutableArray[indexPath.row];
    }];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Default" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Default");
        
        [_mutableArray setObject:alertController.textFields[0].text atIndexedSubscript:indexPath.row];
        
        
        NSArray *array = @[[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        [_tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    }];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }];
    
    [alertController addAction:defaultAction];
    [alertController addAction:cancleAction];
    [self presentViewController:alertController animated:YES completion:nil];
}



// **********************************************************
- (void)defaultCancel {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    //    alertController.view.tintColor = [UIColor redColor];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"default");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    
    
    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end




