//
//  AudioModel.m
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "AudioModel.h"

/*
 @property (nonatomic, strong) NSString *name;
 @property (nonatomic, strong) NSString *filename;
 @property (nonatomic, strong) NSString *lrcname;

 @property (nonatomic, strong) NSString *singer;
 @property (nonatomic, strong) NSString *singerIcon;
 @property (nonatomic, strong) NSString *icon;
 */
@implementation AudioModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[name: %@; filename: %@; lrcname: %@; singer: %@; singerIcon: %@; icon: %@", self.class, self.name, self.filename, self.lrcname, self.singer, self.singerIcon, self.icon];
}

@end
