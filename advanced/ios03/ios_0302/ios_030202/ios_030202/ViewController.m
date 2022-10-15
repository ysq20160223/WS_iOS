//
//  ViewController.m
//  ios_030202
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Shop.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (strong, nonatomic) NSMutableArray *shopArray;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    
    self.shopArray = [NSMutableArray array];
    
    
//    Shop *s1 = [[Shop alloc] init];
//    s1.icon = @"010.png";
//    s1.name = @"图书／音像";
//    s1.desc = @"小说";
//    
//    Shop *s2 = [Shop shopWithName:@"母婴用品" icon:@"011.png" desc:@"洗护, 喂养"];
//    Shop *s3 = [Shop shopWithName:@"孕婴服饰" icon:@"012.png" desc:@"防辐射"];
//    [_shopArray addObjectsFromArray:@[s1, s2, s3]];
    
    for (int i = 0; i < 9; i++) {
        NSString *name = [NSString stringWithFormat:@"name_%d", i];
        NSString *desc = [NSString stringWithFormat:@"desc_%@", name];
        NSString *icon = [NSString stringWithFormat:@"01%d.png", i % 9];
        
        Shop *s = [Shop shopWithName:name icon:icon desc:desc];
        [self.shopArray addObject:s];
    }
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shopArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Shop *shop = self.shopArray[indexPath.row];
    
    UITableViewCell *cell = [UITableViewCell.alloc initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    NSLog(@"row: %ld", indexPath.row); // 验证全部刷新 or 局部刷新
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", shop.name];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", shop.icon]]; // 设置图片
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", shop.desc]; // 详情

    cell.backgroundColor = [UIColor colorWithRed:1 green:.6 blue:0 alpha:.2];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 设置右边图标 箭头
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd]; // 设置右边图标 +
    return cell;
}


#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 99;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row: %ld", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    Shop *shop = self.shopArray[indexPath.row];
    
    /// --
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Messege" preferredStyle:UIAlertControllerStyleAlert];

    //
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        NSLog(@"%@", textField.text);
        textField.text = shop.name;
    }];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        shop.name = alertController.textFields[0].text;

//        [self.tableView reloadData]; // 全部刷新
        NSArray *array = @[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        [self.tableView reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade]; // 局部刷新
    }];

    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"destructive");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];

    [alertController addAction:defaultAction];
    [alertController addAction:cancelAction];
    [alertController addAction:destructiveAction];

    [self presentViewController:alertController animated:YES completion:nil];
    
    
    /// --
//    UIAlertView *alert = [UIAlertView.alloc initWithTitle:@"Title" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Certain", nil];
//    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
//    [alert textFieldAtIndex:0].text = shop.name;
//    [alert show];
//    alert.tag = indexPath.row; // 点击了哪一行
}

//#pragma mark -- UIAlertViewDelegate
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"buttonIndex: %ld", buttonIndex);
//    if(buttonIndex == 0) {
//        return;
//    }
//
//    NSString *text = [alertView textFieldAtIndex:0].text;
////    NSLog(@"%@", text);
//
//    //
//    Shop *shop = self.shopArray[alertView.tag];
//    shop.name = text;
//
////    [_tableView reloadData]; // 重量级, 每一行都会刷新
//
//    // 03020205 - 局部刷新
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
//    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//}

@end


