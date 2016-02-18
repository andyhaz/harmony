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
-(void)fillColor :(float)red :(float)green :(float)blue :(float)alpha{
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedFill = red;
    myGreenFill = green;
    myBlueFill = blue;
    myAlphaFill = alpha;
    
    [ViewControlObjectFill assignStringToFillField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedFill green:myGreenFill blue:myBlueFill alpha:myAlphaFill]]]];
    
    [self setNeedsDisplay:YES];
//NSLog(@"set fill Color:%f,%f,%f",myRedFill,myGreenFill,myBlueFill);
}//change object color


-(void)outlineColor :(float)red :(float)green :(float)blue :(float)alpha{
  //  NSLog(@"new outline Color");
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedOutline = red;
    myGreenOutline = green;
    myBlueOutline = blue;
    myAlphaOutline = alpha;
    
    [ViewControlObjectOutline assignStringToOutlineField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedOutline green:myGreenOutline blue:myBlueOutline alpha:myAlphaOutline]]]];
    
    [self setNeedsDisplay:YES];
  //  NSLog(@"set outline Color");

}//change outline color

-(void)bgColor :(float)red :(float)green :(float)blue :(float)alpha {
    colorUtitle *cu = [[colorUtitle alloc]init];

    myRedBG = red;
    myGreenBG = green;
    myBlueBG = blue;
    myAlphaBG = alpha;
    
    [ViewControlObjectBG assignStringToBGField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG]]]];
    
    [self setNeedsDisplay:YES];
  
  //  NSLog(@"set backgound Color");
}

-(void)textColor :(float)red :(float)green :(float)blue :(float)alpha{
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedText = red;
    myGreenText = green;
    myBlueText = blue;
    myAlphaText = alpha;
    
    NSLog(@"textColor:%f",myRedText);
    
    [ViewControlObjectText assignStringToTextField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText]]]];
    [self setNeedsDisplay:YES];
}

/*- (void)mouseDown:(NSEvent *)theEvent{
     NSLog(@"hello myView");
}*/

- (void)drawRect:(NSRect)dirtyRect {
//  NSLog(@"drawRect");
    [super drawRect:dirtyRect];
// Drawing code here.
    
//set background color
   [[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG] setFill];
    NSRectFill( dirtyRect);
    
//set box and out line color
    NSPoint origin = { 65,15 };
    
    NSRect rect;
    rect.origin = origin;
    rect.size.width  = 100;
    rect.size.height = 100;
    
    NSBezierPath * path;
    path = [NSBezierPath bezierPathWithRect:rect];
    
    [path setLineWidth:3];
    
    [[NSColor colorWithSRGBRed:myRedFill green:myGreenFill blue:myBlueFill alpha:myAlphaFill] setFill];
    //[[NSColor whiteColor] set];
    [path fill];
    
    [[NSColor colorWithSRGBRed:myRedOutline green:myGreenOutline blue:myBlueOutline alpha:myAlphaOutline] set];
   // [[NSColor grayColor] set];
    [path stroke];
    //set color
    
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
     //  NSLog(@"%f:",myRedText);
     CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
     NSMutableDictionary *zDictAttributes = [[NSMutableDictionary alloc] init];
     [zDictAttributes setObject:textFont
     forKey:NSFontAttributeName];
     [zDictAttributes setObject:[NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText]
     forKey:NSForegroundColorAttributeName];
     CGContextSaveGState(context);
     
     [zString drawAtPoint:zPoint withAttributes:zDictAttributes];
}
@end