//
//  ViewController.m
//  ios_13
//
//  Created by Apple on 2017/8/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpTap]; // 点按
    
    [self setUpLongPress]; // 长按
    
    [self setUpSwipe]; // 轻扫
}


// -------------
- (void)setUpSwipe {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [_imageView addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [_imageView addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [_imageView addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_imageView addGestureRecognizer:swipeDown];
}

- (void)swipe:(UISwipeGestureRecognizer *)recognizer {
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"Swipe Direction Right");
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe Direction Left");
            break;
            
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"Swipe Direction Up");
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"Swipe Direction Down");
            break;
    
        default:
            break;
    }
}


// -------------
- (void)setUpLongPress {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [_imageView addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer *)recognizer {
    switch (recognizer.state) {
        case UIGestureRecognizerStatePossible:
            NSLog(@"State Possible");
            break;
            
        case UIGestureRecognizerStateBegan:
            NSLog(@"State Began");
            break;
            
        case UIGestureRecognizerStateChanged:
            NSLog(@"State Changed");
            break;
            
        case UIGestureRecognizerStateEnded:
            NSLog(@"State Ended");
            break;
            
        case UIGestureRecognizerStateCancelled:
            NSLog(@"State Cancelled");
            break;
            
        case UIGestureRecognizerStateFailed:
            NSLog(@"State Failed");
            break;
            
        default:
            break;
    }
    
}


// -------------
- (void)setUpTap {
    // 点按
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    
    tap.delegate = self;
    
    [_imageView addGestureRecognizer:tap];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint curP = [touch locationInView:_imageView];
    NSLog(@"x: %f, w: %f", curP.x, _imageView.bounds.size.width);
    if (curP.x < _imageView.bounds.size.width * 0.5) {
        return YES;
    } else {
        return NO;
    }
//    return NO;
}

- (void)tap {
    NSLog(@"%s", __func__);
    
}

@end


