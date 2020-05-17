//
//  CmtModel.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/19.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "CmtModel.h"

@implementation CmtModel


/**
 @property (nonatomic, strong) NSString *content;
 @property (nonatomic, strong) UserModel *user;
 @property (nonatomic, strong) NSString *like_count;
 @property (nonatomic, strong) NSString *voicetime;
 @property (nonatomic, strong) NSString *voiceuri;
 @property (nonatomic, assign) NSInteger ID;
 */
#pragma mark -
- (NSString *)description {
    return [NSString stringWithFormat:@"CmtModel[index: %ld; ID: %ld; content: %@; user: %@; like_count: %@; voicetime: %@; voiceuri: %@]", self.index, self.ID, self.content, self.user, self.like_count, self.voicetime, self.voiceuri];
}

@end
