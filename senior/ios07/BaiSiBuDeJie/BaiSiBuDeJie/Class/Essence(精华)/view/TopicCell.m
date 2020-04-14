//
//  TopicCell.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/4/13.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "TopicCell.h"
#import "TopicModel.h"
#import "BSConst.h"

#import "UIImageView+WebCache.h"

@interface TopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *ivUserProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;

@end



@implementation TopicCell

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
    
    [self.ivUserProfile sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image]];
    self.lblName.text = topicModel.name;
    self.lblTime.text = topicModel.created_at;
    
}

- (void)setFrame:(CGRect)frame {
    frame.size.height -= BSMargin;
    frame.origin.x += BSMargin;
    frame.origin.y += BSMargin;
    frame.size.width -= 2 * BSMargin;
    [super setFrame:frame];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


#pragma mark - Click
- (IBAction)clickBtnMore:(UIButton *)sender {
//    XLog
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Title" message:@"message" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [ac addAction:[UIAlertAction actionWithTitle:@"Collection" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Collection");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Inform" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Inform");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel");
    }]];
    
    [self.window.rootViewController presentViewController:ac animated:YES completion:nil];
}

@end


