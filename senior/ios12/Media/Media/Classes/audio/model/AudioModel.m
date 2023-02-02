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
 @property (nonatomic, strong) NSString *url;
 @property (nonatomic, strong) NSString *author;

 @property (nonatomic, strong) NSString *ID;
 @property (nonatomic, strong) NSString *albumPic;
 */
@implementation AudioModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[name: %@; url: %@; author: %@; nameNoSuffix: %@; albumPic: %@", self.class, self.name, self.url, self.author, self.nameNoSuffix, self.albumPic];
}

@end



@implementation AudioListModel

- (NSString *)description {
    return [NSString stringWithFormat:@"%@[CODE: %ld; data: %@]", self.class, self.CODE, self.data];
}

@end






