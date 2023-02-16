//
//  XDiscoverVc.m
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XDiscoverVc.h"
#import "XGroupBuyVc.h"

@interface XDiscoverVc ()

@end



@implementation XDiscoverVc

+ (instancetype)instance {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:[NSString stringWithFormat:@"%@", self.class] bundle:nil];
    return [sb instantiateInitialViewController];
}


- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}


#pragma mark - UITableViewDataSource start
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    NSLog(@"indexPath: %@", indexPath);
    
    if (0 == indexPath.section) {
        XGroupBuyVc *groupBuyVc = XGroupBuyVc.alloc.init;
        groupBuyVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:groupBuyVc animated:YES];
    }
}
#pragma mark - UITableViewDataSource end

@end


