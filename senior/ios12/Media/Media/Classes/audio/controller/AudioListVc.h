//
//  AudioListVc.h
//  Media
//
//  Created by Apple on 2022/9/3.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioListVc : UIViewController

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


- (IBAction)onClickAudio:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
