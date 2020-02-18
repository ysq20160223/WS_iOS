//
//  ViewController.m
//  ios_091303
//
//  Created by Apple on 2017/8/6.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

#import "ProgressView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;


- (IBAction)valueChanged:(id)sender;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)valueChanged:(UISlider *)sender {
//    NSLog(@"%f", sender.value);
    _textLabel.text = [NSString stringWithFormat:@"%.2f%%", sender.value * 100];
    
    self.progressView.progress = sender.value;
}


@end
