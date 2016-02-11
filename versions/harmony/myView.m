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
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedText = redBG;
    myGreenText = greenBG;
    myBlueText = blueBG;
    myAlphaText = alphaBG;
    
    [ViewControlObject assignStringToTextField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText]]]];
    
    [self setNeedsDisplay:YES];
//NSLog(@"set text Color %f",myRedText);
}//change object color
-(void)textColorHex:(NSString*)hex{
    
}

-(void)outlineColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
  //  NSLog(@"new outline Color");
    myRedObj = redBG;
    myGreenObj = greenBG;
    myBlueObj = blueBG;
    myAlphaObj = alphaBG;
    
//    [myControlObj2 assignStringToOutlineField:[NSString stringWithFormat:@"#%@",[self getHexStringForColor:[NSColor colorWithSRGBRed:myRedObj green:myGreenObj blue:myBlueObj alpha:myAlphaText]]]];
 //   [self setMyString: [myControlObj2 returnNOutlineField]];
    
    [self setNeedsDisplay:YES];
}//change bg color

-(void)outlineColorHex:(NSString*)hex{
    
}

-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
    colorUtitle *cu = [[colorUtitle alloc]init];

    myRedBG = redBG;
    myGreenBG = greenBG;
    myBlueBG = blueBG;
    myAlphaBG = alphaBG;
    
    [ViewControlObjectB assignStringToBGField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaText]]]];
//[self setMyString: [myControlObj3 returnNBGField]];
    
    [self setNeedsDisplay:YES];
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

/*- (void)mouseDown:(NSEvent *)theEvent{
     NSLog(@"hello myView");
}*/

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
  //  NSLog(@"drawRect");
    NSString * zString	= @"Harmony";
    NSPoint	zPoint;
    zPoint.x	= 30.0;
    zPoint.y	= 50.0;
    
    //setup text
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    NSFont *textFont = [fontManager fontWithFamily:@"Helvetica"
                                            traits:NSUnboldFontMask
                                            weight:0
                                              size:40];
    //set text color
    NSColor *textColor = [NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText];
  //  NSLog(@"%f:",myRedText);
    
    //set background color
   [[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG] setFill];
    NSRectFill( dirtyRect );
  //  NSLog(@"myRedBG: %f",myRedBG);
    
    CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];

    NSMutableDictionary *zDictAttributes = [[NSMutableDictionary alloc] init];

    [zDictAttributes setObject:textFont
                     forKey:NSFontAttributeName];
    
    [zDictAttributes setObject:textColor
                     forKey:NSForegroundColorAttributeName];
    CGContextSaveGState(context);

    [zString drawAtPoint:zPoint withAttributes:zDictAttributes];
}
@end
// Create a grayscale context for the mask
/*
 //CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.7);
 CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
 CGContextSetTextDrawingMode(context, kCGTextFillStroke);
 //[zString drawAtPoint:point withFont:textFont];
 
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

