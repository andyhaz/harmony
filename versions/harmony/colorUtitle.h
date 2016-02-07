//
//  colorUtitle.h
//  harmony
//
//  Created by andrew hazlett on 2/5/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface colorUtitle : NSColor {
    float myRedColor;
    float myGreenColor;
    float myBlueColor;
    float myAlphaColor;
}

-(NSColor *)colorFromHexArray:(NSArray *)colorArray;
- (NSColor *)colorFromHexString:(NSString *)hexString;
- (NSString *)getHexStringForColor:(NSColor*)color;

@end