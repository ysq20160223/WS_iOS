//
//  XBaseSettingVc.h
//  ios_0921
//
//  Created by Apple on 2017/8/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XGroupItem.h"

@interface XBaseSettingVc : UITableViewController

@property (nonatomic, strong) NSMutableArray<XGroupItem *> *groupArray; // 保存当前有多少组

@end
