//
//  VideoListCVCell.h
//  Media
//
//  Created by Apple on 2022/9/4.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoListCVCell : UICollectionViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
//@property (weak, nonatomic) IBOutlet UILabel *lblFileName;
//@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;

@property (weak, nonatomic) IBOutlet UILabel *lblFileName;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;


- (void)setVideoModel:(VideoModel *)videoModel withIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
