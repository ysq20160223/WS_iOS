//
//  ViewController.h
//  ios_030304
//
//  Created by Apple on 2017/7/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


// ------------
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trash;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


// ------------
- (IBAction)trash:(UIBarButtonItem *)sender;


@end





