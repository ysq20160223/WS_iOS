//
//  ViewController.m
//  ios_03020201
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "Shop.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
{
    NSMutableArray *_shops;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _shops = [NSMutableArray array];
    
    Shop *s1 = [[Shop alloc] init];
    s1.icon = @"001.png";
    s1.name = @"图书／音像";
    s1.desc = @"小说";
    
    Shop *s2 = [Shop shopWithName:@"母婴用品" icon:@"002.png" desc:@"洗护, 喂养"];
    Shop *s3 = [Shop shopWithName:@"孕婴服饰" icon:@"003.png" desc:@"防辐射"];
    
    [_shops addObjectsFromArray:@[s1, s2, s3]];
    
//    for (int i = 0; i < 18; i++) {
//        NSString *name = [NSString stringWithFormat:@"name-%d", i];
//        NSString *desc = [NSString stringWithFormat:@"desc-%@", name];
//        NSString *icon = [NSString stringWithFormat:@"00%d.png", (i % 6) + 4];
//        
//        Shop *s = [Shop shopWithName:name icon:icon desc:desc];
//        [_shops addObject:s];
//    }
    
}

// *
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"number of rows in section : %ld", _shops.count);
    return _shops.count;
}

// *
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    Shop *shop = _shops[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", shop.name];
    
    // 设置图片
    NSString *imgName = [NSString stringWithFormat:@"%@", shop.icon];
    cell.imageView.image = [UIImage imageNamed:imgName];
    
    // 详情
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", shop.desc];
    
    // 设置右边图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 箭头
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd]; // +
    
//    NSLog(@"cell for row at index path : %ld", indexPath.row);
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 77;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"row = %ld", indexPath.row);
    
    Shop *s = _shops[indexPath.row];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"certain", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text = s.name;
    
    [alert show];
    
    alert.tag = indexPath.row; // 点击了哪一行
    
    //
//    UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert ];
    
//    [alter showViewController:self sender:nil];
    
}

//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) return;
    
    NSString *text = [alertView textFieldAtIndex:0].text;
//    NSLog(@"%@", text);
    
    //
    Shop *s = _shops[alertView.tag];
    s.name = text;
    
//    [_tableView reloadData]; // 重量级, 每一行都会刷新
    
    // 局部刷新
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
    NSArray *paths = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationFade];
    
}

// 默认返回1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end




