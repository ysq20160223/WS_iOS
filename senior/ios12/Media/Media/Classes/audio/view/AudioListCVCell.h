//
//  AudioListCVCell.h
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AudioModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AudioListCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblFileName;
@property (weak, nonatomic) IBOutlet UILabel *lblSinger;

@property (strong, nonatomic) AudioModel *audioModel;

- (void)setAudioModel:(AudioModel *)audioModel withIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
