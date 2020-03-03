//
//  BaseBean.m
//  ios_100904
//
//  Created by Apple on 2020/3/1.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "BaseBean.h"

@implementation BaseBean

- (NSString *)description {
    return [NSString stringWithFormat:@"BaseBean = [code: %ld, video: %@]", self.code, self.video];
}

@end
