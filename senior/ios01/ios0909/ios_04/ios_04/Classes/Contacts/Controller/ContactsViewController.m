//
//  ContactsViewController.m
//  ios_04
//
//  Created by Apple on 2017/8/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ContactsViewController.h"
#import "AddViewController.h"
#import "EditViewController.h"
#import "Contact.h"

@interface ContactsViewController () <UIActionSheetDelegate, AddViewControllerDelegate>

//
- (IBAction)logout:(UIBarButtonItem *)sender;

@end



@implementation ContactsViewController

- (NSMutableArray *)contactArray {
    if(nil == _contactArray) {
        _contactArray = [NSMutableArray array];
    }
    return _contactArray;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateContact) name:@"updateContact" object:nil];
}

- (void)updateContact {
    [self.tableView reloadData];
}

// 点击 LogOut
- (IBAction)logout:(UIBarButtonItem *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Tip" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log out" otherButtonTitles:nil, nil];
    [sheet showInView:self.view];
}

// 监听 UIActionSheet 上按钮的点击
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"%ld", buttonIndex);
    
    if (buttonIndex == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

// 跳转 AddViewController 之前赋值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"");
    if ([segue.destinationViewController isKindOfClass:[AddViewController class]]) {
        AddViewController *addVc = segue.destinationViewController;
        addVc.delegate = self;
    } else if ([segue.destinationViewController isKindOfClass:[EditViewController class]]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        EditViewController *editVc = segue.destinationViewController;
        editVc.contact = self.contactArray[indexPath.row];
    }
    
    // 耦合性高, 不建议使用
//    AddViewController *addVc = segue.destinationViewController;
//    addVc.contactVc = self;
}


#pragma mark - AddViewControllerDelegate start
// 添加一个新的联系人的时候回调
- (void)addViewController:(AddViewController *)addVc didAddContact:(Contact *)contact {
    NSLog(@"contact: %@", contact);
    
    [self.contactArray addObject:contact]; // 保存联系人
    [self.tableView reloadData]; // 加载数据
}
#pragma mark - AddViewControllerDelegate end


#pragma mark - UITableViewDataSource start
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contactArray.count;
}

// 每行数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    if(nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
//    }
    
    Contact *contact = self.contactArray[indexPath.row];
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    return cell;
}
#pragma mark - UITableViewDataSource end

//
//-(void)setContact:(Contact *)contact {
//    _contact = contact;
//    NSLog(@"%@", _contact);
//}

// 给 navigationItem 的 titleView 赋值
//-(void)setAccount:(NSString *)account {
//    _account = account;
//    self.navigationItem.title = [NSString stringWithFormat:@"%@ Contacts", account];
//}

@end






