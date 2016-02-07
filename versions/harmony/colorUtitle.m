//
//  colorUtitle.m
//  harmony
//
//  Created by andrew hazlett on 2/5/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "colorUtitle.h"

@implementation colorUtitle

-(NSColor *)colorFromHexArray:(NSArray *)colorArray{
    
    return [NSColor colorWithCalibratedRed:[colorArray[0] floatValue] green:[colorArray[1] floatValue] blue:[colorArray[2] floatValue] alpha:[colorArray[3] floatValue]];
}


- (NSColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [NSColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

//color
- (NSString *)getHexStringForColor:(NSColor*)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
}
// Assumes input like "#00FF00" (#RRGGBB).

@end
