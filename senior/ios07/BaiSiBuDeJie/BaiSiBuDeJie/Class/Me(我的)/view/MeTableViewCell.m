//
//  MeTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/28.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "MeTableViewCell.h"
#import "UIView+X.h"
#import "BSConst.h"

@implementation MeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        
        self.textLabel.textColor = [UIColor blackColor];
        
        //        self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (nil == self.imageView.image) {
        return;
    }
    self.imageView.xX = 16;
    self.imageView.xY = BSMargin;
    self.imageView.xHeight = self.contentView.xHeight - 2 * BSMargin;
//    self.imageView.xWidth = self.imageView.xHeight;

    self.textLabel.xX = self.imageView.xRight + BSMargin;
//    self.textLabel.backgroundColor = [UIColor cyanColor];
    
//    NSLog(@"imageView: %@; textLabel: %@", self.imageView, self.textLabel);

}

@end


