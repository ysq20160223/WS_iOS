//
//  MyNewFeatureViewCell.h
//  ios_0921
//
//  Created by Apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNewFeatureViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

//
- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
