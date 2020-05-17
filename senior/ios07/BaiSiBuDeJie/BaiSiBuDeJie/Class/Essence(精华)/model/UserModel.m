//
//  UserModel.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (NSString *)description {
    return [NSString stringWithFormat:@"UserModel[username: %@; profile_image: %@; sex: %@; total_cmt_like_count: %ld]", self.username, self.profile_image, self.sex, self.total_cmt_like_count];
}

@end
