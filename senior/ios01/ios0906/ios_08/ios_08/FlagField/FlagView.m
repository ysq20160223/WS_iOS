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

@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *countryIconView;

@end



@implementation FlagView


+ (instancetype)flagViewWithFlag:(Flag *)flag {
    FlagView *flagView = [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil][0];
    flagView.flag = flag;
    return flagView;
}



- (void)setFlag:(Flag *)flag {
    _flag = flag;
    
    _countryNameLabel.text = flag.countryName;
    _countryIconView.image = flag.countryIcon;
}

@end




