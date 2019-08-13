//
//  ViewController.m
//  ios_03020201
//
//  Created by Apple on 2017/7/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "../../../../PreHeader.h"

#import "Shop.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate> {
    NSMutableArray *_shopArray;
}
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView.frame = self.view.bounds;
    
    _shopArray = [NSMutableArray array];
    
    
    Shop *s1 = [[Shop alloc] init];
    s1.icon = @"001.png";
    s1.name = @"图书／音像";
    s1.desc = @"小说";
    
    Shop *s2 = [Shop shopWithName:@"母婴用品" icon:@"002.png" desc:@"洗护, 喂养"];
    Shop *s3 = [Shop shopWithName:@"孕婴服饰" icon:@"003.png" desc:@"防辐射"];
    [_shopArray addObjectsFromArray:@[s1, s2, s3]];
    
//    for (int i = 0; i < 18; i++) {
//        NSString *name = [NSString stringWithFormat:@"name-%d", i];
//        NSString *desc = [NSString stringWithFormat:@"desc-%@", name];
//        NSString *icon = [NSString stringWithFormat:@"00%d.png", (i % 9) + 1];
//        
//        Shop *s = [Shop shopWithName:name icon:icon desc:desc];
//        [_shopArray addObject:s];
//    }
}


#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _shopArray.count;
}

// 默认返回1
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Shop *shop = _shopArray[indexPath.row];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", shop.name];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", shop.icon]]; // 设置图片
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", shop.desc]; // 详情

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 设置右边图标 箭头
//    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd]; // 设置右边图标 +
    return cell;
}


#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 99;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"row: %ld", indexPath.row);
    
    Shop *s = _shopArray[indexPath.row];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Certain", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert textFieldAtIndex:0].text = s.name;
    [alert show];
    alert.tag = indexPath.row; // 点击了哪一行
}


#pragma mark -- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex: %ld", buttonIndex);
    if(buttonIndex == 0) {
        return;
    }
    
    NSString *text = [alertView textFieldAtIndex:0].text;
//    NSLog(@"%@", text);
    
    //
    Shop *s = _shopArray[alertView.tag];
    s.name = text;
    
//    [_tableView reloadData]; // 重量级, 每一行都会刷新
    
    // 03020205 - 局部刷新
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

@end




