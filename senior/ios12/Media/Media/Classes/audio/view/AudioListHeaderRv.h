//
//  AudioListHeaderRv.h
//  Media
//
//  Created by Apple on 2022/11/28.
//  Copyright © 2022 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AudioListHeaderRv : UICollectionReusableView


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

@end

NS_ASSUME_NONNULL_END
