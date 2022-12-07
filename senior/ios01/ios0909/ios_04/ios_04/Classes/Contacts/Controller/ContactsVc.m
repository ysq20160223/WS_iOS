//
//  ContactsVc.m
//  ios_04
//
//  Created by Apple on 2017/8/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ContactsVc.h"
#import "AddVc.h"
#import "EditVc.h"
#import "Contact.h"

@interface ContactsVc () <UIActionSheetDelegate, AddVcDelegate>

//
- (IBAction)logout:(UIBarButtonItem *)sender;

@end



@implementation ContactsVc

- (NSMutableArray *)contactArray {
    if(nil == _contactArray) {
        _contactArray = NSMutableArray.array;
    }
    return _contactArray;
}

-(void)dealloc {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    XLog
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(updateContact) name:@"updateContact" object:nil];
}

- (void)updateContact {
    [self.tableView reloadData];
}

// 点击 LogOut
//- (IBAction)logout:(UIBarButtonItem *)sender {
//    UIActionSheet *sheet = [UIActionSheet.alloc initWithTitle:@"Tip" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Log out" otherButtonTitles:nil, nil];
//    [sheet showInView:self.view];
//}
//
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
////    NSLog(@"%ld", buttonIndex);
//    if (!buttonIndex) {
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//}


- (IBAction)logout:(UIBarButtonItem *)sender {
    UIAlertController *ac = UIAlertController.alloc.init;
    [ac addAction:[UIAlertAction actionWithTitle:@"Logout" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        XLog
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    
    ac.title = @"TIP";
    
    [self presentViewController:ac animated:YES completion:nil];
}



// 跳转 AddViewController 之前赋值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    XLog
    if ([segue.destinationViewController isKindOfClass:AddVc.class]) {
        AddVc *addVc = segue.destinationViewController;
        addVc.delegate = self;
    } else if ([segue.destinationViewController isKindOfClass:EditVc.class]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        EditVc *editVc = segue.destinationViewController;
        editVc.contact = self.contactArray[indexPath.row];
    }
    
    // 耦合性高, 不建议使用
//    AddViewController *addVc = segue.destinationViewController;
//    addVc.contactVc = self;
}


#pragma mark - AddViewControllerDelegate start
// 添加一个新的联系人的时候回调
- (void)addVc:(AddVc *)addVc didAddContact:(Contact *)contact {
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


