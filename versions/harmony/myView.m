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
-(void)fillColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedFill = redBG;
    myGreenFill = greenBG;
    myBlueFill = blueBG;
    myAlphaFill = alphaBG;
    
    [ViewControlObject assignStringToFillField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedFill green:myGreenFill blue:myBlueFill alpha:myAlphaFill]]]];
    
    [self setNeedsDisplay:YES];
NSLog(@"set fill Color:%f,%f,%f",myRedFill,myGreenFill,myBlueFill);
}//change object color


-(void)outlineColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
  //  NSLog(@"new outline Color");
    colorUtitle *cu = [[colorUtitle alloc]init];
    
    myRedOutline = redBG;
    myGreenOutline = greenBG;
    myBlueOutline = blueBG;
    myAlphaOutline = alphaBG;
    
    [ViewControlObjectA assignStringToOutlineField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedOutline green:myGreenOutline blue:myBlueOutline alpha:myAlphaOutline]]]];
    
    [self setNeedsDisplay:YES];
    NSLog(@"set outline Color");

}//change bg color

-(void)outlineColorHex:(NSString*)hex{
    
}

-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
    colorUtitle *cu = [[colorUtitle alloc]init];

    myRedBG = redBG;
    myGreenBG = greenBG;
    myBlueBG = blueBG;
    myAlphaBG = alphaBG;
    
    [ViewControlObjectB assignStringToBGField:[NSString stringWithFormat:@"#%@",[cu getHexStringForColor:[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG]]]];
//[self setMyString: [myControlObj3 returnNBGField]];
    
    [self setNeedsDisplay:YES];
    
    NSLog(@"set backgound Color");
}

//set the string
-(void)setMyString:(NSString *)pString;
{
    // prevent an NSInvalidArgumentException if pString is nil.
    if(pString) {
        myFillString = [[NSString alloc]initWithString:	pString];
    } else {
        myFillString = @"";
    } // end if
    
}// end setMyString

/*- (void)mouseDown:(NSEvent *)theEvent{
     NSLog(@"hello myView");
}*/

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
// Drawing code here.
  NSLog(@"drawRect");
    
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
}
@end