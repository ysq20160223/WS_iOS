//
//  FlagView.m
//  ios_08
//
//  Created by Apple on 2017/7/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "FlagView.h"
#import "Flag.h"

@interface FlagView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end


@implementation FlagView

+ (instancetype)flagView {
    return [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil][0];
}

- (void)setFlag:(Flag *)flag {
    _flag = flag;
    
    _nameLabel.text = flag.name;
    _iconView.image = flag.icon;
}

@end




