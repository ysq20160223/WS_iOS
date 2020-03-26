//
//  LoginRegisterTextField.m
//  BaiSiBuDeJie
//
//  Created by Apple on 2020/3/23.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "LoginRegisterTextField.h"

#import "UITextField+X.h"

@interface LoginRegisterTextField() <UITextFieldDelegate>

//@property (strong, nonatomic) id observerUITextFieldTextDidEndEditingNotification;

@end



@implementation LoginRegisterTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tintColor = [UIColor whiteColor];
    
    
    // method third - runtime
//    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    self.placehoderColor = [UIColor grayColor];
    
    // addTarget
    [self addTarget:self action:@selector(editingDidBegin)  forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    
    
    // delegate 不建议使用代理(set 方法可能被覆盖)
//    self.delegate = self;
    
    
    // notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing) name:UITextFieldTextDidEndEditingNotification object:self];
    
    // 一次性通知
//    id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidEndEditingNotification object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//        XLog
//        [[NSNotificationCenter defaultCenter] removeObserver:observer];
//    }];
    
}

#pragma mark -
- (BOOL)becomeFirstResponder {
//    NSLog(@"%@", self.placeholder);
    return [super becomeFirstResponder];
}
- (BOOL)resignFirstResponder {
//    NSLog(@"%@", self.placeholder);
    return [super resignFirstResponder];
}
#pragma mark -


#pragma mark - NSNotificationCenter begin
- (void)beginEditing {
    XLog
}

- (void)endEditing {
    XLog
}
#pragma mark - NSNotificationCenter end


#pragma mark - UITextFieldDelegate begin
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return YES;
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField {
////    XLog
//    [self setValue:[UIColor lightGrayColor] forKeyPath:@"placeholderLabel.textColor"];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField {
////    XLog
//    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
//}
#pragma mark - UITextFieldDelegate end


#pragma mark - target begin
- (void)editingDidBegin {
//    XLog
    self.placehoderColor = [UIColor whiteColor];
//    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}

- (void)editingDidEnd {
//    XLog
    self.placehoderColor = [UIColor grayColor];
//    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
#pragma mark - target end

//- (void)drawPlaceholderInRect:(CGRect)rect {
//    NSMutableDictionary *attrDict = [NSMutableDictionary dictionary];
//    attrDict[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    attrDict[NSFontAttributeName] = self.font;
//
//
//    // method first
////    CGRect placeholderRect;
////    placeholderRect.size.width = rect.size.width;
////    placeholderRect.size.height = self.font.lineHeight;
////    placeholderRect.origin.x = 0;
////    placeholderRect.origin.y = (rect.size.height - self.font.lineHeight) * 0.5;
////    [self.placeholder drawInRect:placeholderRect withAttributes:attrDict];
//
//
//    // method second
////    [self.placeholder drawAtPoint:CGPointMake(0, (rect.size.height - self.font.lineHeight) * 0.5) withAttributes:attrDict];
//}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self.observerUITextFieldTextDidEndEditingNotification];
}

@end


