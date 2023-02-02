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
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *author;

@property (nonatomic, strong) NSString *nameNoSuffix;
@property (nonatomic, strong) NSString *albumPic;

@end



@interface AudioListModel : NSObject

@property (nonatomic, assign) NSInteger CODE;
@property (nonatomic, strong) NSArray<AudioModel *> *data;

@end

NS_ASSUME_NONNULL_END
