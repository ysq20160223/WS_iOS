//
//  ViewController_.h
//  ios_020401
//
//  Created by Apple on 2017/7/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController_ : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

- (IBAction)indexChange:(UISegmentedControl *)sender;

@end

