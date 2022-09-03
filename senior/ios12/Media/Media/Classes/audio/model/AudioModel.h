//
//  AudioModel.h
//  Media
//
//  Created by Apple on 2020/5/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *lrcname;

@property (nonatomic, strong) NSString *singer;
@property (nonatomic, strong) NSString *singerIcon;
@property (nonatomic, strong) NSString *icon;

@end

NS_ASSUME_NONNULL_END
