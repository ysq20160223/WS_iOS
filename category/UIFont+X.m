//
//  UIFont+X.m
//  Nxin
//
//  Created by Apple on 2020/9/26.
//  Copyright © 2020 Apple. All rights reserved.
//

#import "UIFont+X.h"

@implementation UIFont (X)


+ (NSString *)fontName:(NSString *)resource {
    NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:nil];
    NSURL *fontUrl = [NSURL fileURLWithPath:path];
    CGDataProviderRef fontDataProvider = CGDataProviderCreateWithURL((__bridge CFURLRef)fontUrl);
    CGFontRef fontRef = CGFontCreateWithDataProvider(fontDataProvider);
    CGDataProviderRelease(fontDataProvider);
    //    CTFontManagerRegisterGraphicsFont(fontRef, NULL);
    NSString *fontName = CFBridgingRelease(CGFontCopyPostScriptName(fontRef));
    NSLog(@"fontName: %@", fontName);
    return fontName;
}

@end
