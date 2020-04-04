//
//  MeFooterSquareModel.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/29.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeFooterSquareModel.h"

@implementation MeFooterSquareModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[name: %@; icon: %@; url: %@]", self.class, self.name, self.icon, self.url];
}

@end
