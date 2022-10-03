//
//  RowView.h
//  ios_020601
//
//  Created by Apple on 2017/7/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowView : UIView

@property (weak, nonatomic) IBOutlet UIButton *btnIcon;

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UIButton *btnDelete;


// ----------------
+ (id)rowViewWithIcon:(NSString *)icon andName:(NSString *)name;


@end


