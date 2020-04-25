//
//  CmtModel.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CmtModel.h"

@implementation CmtModel

#pragma mark -
- (NSString *)description {
    return [NSString stringWithFormat:@"CmtModel[content: %@; user: %@]", self.content, self.user];
}

@end
