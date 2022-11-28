//
//  AudioListHeaderRv.m
//  Media
//
//  Created by Apple on 2022/11/28.
//  Copyright © 2022 Apple. All rights reserved.
//

#import "AudioListHeaderRv.h"
#import "AudioTool.h"
#import "AudioModel.h"

@interface AudioListHeaderRv ()

@property (weak, nonatomic) IBOutlet UIImageView *ivBg;

@end



@implementation AudioListHeaderRv


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [NSBundle.mainBundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].lastObject;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self onClickImageViewBg];
    
    self.backgroundColor = UIColor.magentaColor;
    
    self.ivBg.userInteractionEnabled = YES;
    [self.ivBg addGestureRecognizer:[UITapGestureRecognizer.alloc initWithTarget:self action:@selector(onClickImageViewBg)]];
    
}

- (void)onClickImageViewBg {
    NSArray<AudioModel *> *array = AudioTool.audioArray;
    int random = arc4random_uniform(array.count);
    NSLog(@"random: %d", random);
    if (random < 0) {
        random = 0;
    } else if (random >= array.count) {
        random = array.count - 1;
    }
    AudioModel *audioModel = array[random];
    
    self.ivBg.image = [UIImage imageNamed:audioModel.icon];
}

@end


