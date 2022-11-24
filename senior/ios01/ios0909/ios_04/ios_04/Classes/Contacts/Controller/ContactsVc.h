//
//  ContactsVc.h
//  ios_04
//
//  Created by Apple on 2017/8/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;

@interface ContactsVc : UITableViewController

@property (nonatomic, strong) NSString *account; // 接收上个界面传递的账号

//@property (nonatomic, strong) Contact *contact; // 接收下一个界面传递的联系人模型

@property (nonatomic, strong) NSMutableArray *contactArray; // 接收逆传


@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
