//
//  RecommendCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/5/4.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "RecommendCell.h"

#import "UIImageView+WebCache.h"

//#import "UIImage+X.h"
#import "UIImageView+X.h"


@interface RecommendCell()

@property (weak, nonatomic) IBOutlet UIImageView *ivImageList;
@property (weak, nonatomic) IBOutlet UILabel *lblThemeName;
@property (weak, nonatomic) IBOutlet UILabel *lblSubNumber;

@end



@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setRecommendModel:(RecommendModel *)recommendModel {
    _recommendModel = recommendModel;
    
//    [self.ivImageList sd_setImageWithURL:[NSURL URLWithString:recommendModel.image_list] placeholderImage:[UIImage xCircleImageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//        if (image) {
//            self.ivImageList.image = [image xCircleImage];
//        }
//
//    }];
    [self.ivImageList xCircle:recommendModel.image_list placeholder:@"defaultUserIcon"];
    
    self.lblThemeName.text = recommendModel.theme_name;
    self.lblSubNumber.text = [NSString stringWithFormat:@"%ld", recommendModel.sub_number];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
