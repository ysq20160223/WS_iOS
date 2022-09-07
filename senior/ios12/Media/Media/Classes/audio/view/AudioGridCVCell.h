//
//  AudioGridCVCell.h
//  Media
//
//  Created by Apple on 2022/9/7.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AudioModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioGridCVCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblFileName;
@property (weak, nonatomic) IBOutlet UILabel *lblSinger;
@property (weak, nonatomic) IBOutlet UIView *vBottom;

@property (strong, nonatomic) AudioModel *audioModel;

- (void)setAudioModel:(AudioModel *)audioModel withIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
