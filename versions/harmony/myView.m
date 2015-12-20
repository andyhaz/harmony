//
//  myView.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "myView.h"
@implementation myView

//change  color
-(void)textColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
//NSLog(@"new text Color");
    myRedText = redBG;
    myGreenText = greenBG;
    myBlueText = blueBG;
    myAlphaText = alphaBG;
    
    [myControlObj assignStringToTextField:[NSString stringWithFormat:@"#%@",[self getHexStringForColor:[NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText]]]];
    [self setMyString: [myControlObj returnNTextField]];
    
    [self setNeedsDisplay:YES];
}//change object color

-(void)outlineColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
  //  NSLog(@"new outline Color");
    myRedObj = redBG;
    myGreenObj = greenBG;
    myBlueObj = blueBG;
    myAlphaObj = alphaBG;
    
    [myControlObj2 assignStringToOutlineField:[NSString stringWithFormat:@"#%@",[self getHexStringForColor:[NSColor colorWithSRGBRed:myRedObj green:myGreenObj blue:myBlueObj alpha:myAlphaText]]]];
    [self setMyString: [myControlObj2 returnNOutlineField]];
    
    [self setNeedsDisplay:YES];
}//change bg color

-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
//NSLog(@"new background Color");
    myRedBG = redBG;
    myGreenBG = greenBG;
    myBlueBG = blueBG;
    myAlphaBG = alphaBG;
    
    [myControlObj3 assignStringToBGField:[NSString stringWithFormat:@"#%@",[self getHexStringForColor:[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaText]]]];
    [self setMyString: [myControlObj3 returnNBGField]];
    
    [self setNeedsDisplay:YES];
}
//color
- (NSString *)getHexStringForColor:(NSColor*)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
}
//set the string
-(void)setMyString:(NSString *)pString;
{
    // prevent an NSInvalidArgumentException if pString is nil.
    if(pString) {
        myTextString = [[NSString alloc]initWithString:	pString];
    } else {
        myTextString = @"";
    } // end if
    
}// end setMyString

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
    NSString * zString	= @"Harmony";
    NSPoint	zPoint;
    zPoint.x	= 30.0;
    zPoint.y	= 50.0;
    //set background color
   // NSColor *bgColor = [NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG];
    NSColor *textColor = [NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText];
  //  NSColor *outlineColor = [NSColor colorWithSRGBRed:myRedObj green:myGreenObj blue:myBlueObj alpha:myAlphaObj];
   [[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG] setFill];
    NSRectFill( dirtyRect );
   //disply text
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    NSFont *textFont = [fontManager fontWithFamily:@"Helvetica"
                                    traits:NSUnboldFontMask
                                    weight:0
                                    size:40];
   
    NSMutableDictionary *zDictAttributes = [[NSMutableDictionary alloc] init];
    [zDictAttributes setObject:textFont
                     forKey:NSFontAttributeName];
    
    [zDictAttributes setObject:textColor
                     forKey:NSForegroundColorAttributeName];
    
    [zString drawAtPoint:zPoint withAttributes:zDictAttributes];

    // Create a grayscale context for the mask
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceGray();
    CGContextRef maskContext =
    CGBitmapContextCreate(
                          NULL,
                          self.bounds.size.width,
                          self.bounds.size.height,
                          8,
                          self.bounds.size.width,
                          colorspace,
                          0);
    CGColorSpaceRelease(colorspace);
    
    // Switch to the context for drawing
    NSGraphicsContext *maskGraphicsContext =
    [NSGraphicsContext
     graphicsContextWithGraphicsPort:maskContext
     flipped:NO];
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext:maskGraphicsContext];
    
    

 
 /*
    //Draw a black background
     [bgColor setFill];
     CGContextFillRect(maskContext, dirtyRect);

    //Draw the text right-way-up (non-flipped context)
    [zString drawInRect:dirtyRect withAttributes:
      [NSDictionary dictionaryWithObjectsAndKeys:
      [NSFont fontWithName:@"Helvetica" size:40], NSFontAttributeName,
      [NSColor whiteColor], NSForegroundColorAttributeName,
      nil]];
    


    //Switch back to the window's context
    [NSGraphicsContext restoreGraphicsState];
    
    //Create an image mask from what we've drawn so far
    CGImageRef alphaMask = CGBitmapContextCreateImage(maskContext);
    
    //Draw a white background in the window
  CGContextRef windowContext = [[NSGraphicsContext currentContext] graphicsPort];
    [bgColor setFill];
    
    
    CGContextFillRect(windowContext, dirtyRect);
    //Draw the box, clipped by the mask
    CGContextSaveGState(windowContext);
   // NSRect size = NSMakeRect(35, 10, 200, 100);
    CGContextClipToMask(windowContext, NSRectToCGRect(self.bounds), alphaMask);
    [outlineColor set];//set to chenge the color
    NSRectFill(dirtyRect);
   // [[NSImage imageNamed:@"shuttle"] drawInRect:dirtyRect fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0];
    CGContextRestoreGState(windowContext);
    CGImageRelease(alphaMask);
    //
   */
}
@end
