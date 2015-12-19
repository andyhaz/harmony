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
    NSLog(@"new text Color");
    myRedText = redBG;
    myGreenText = greenBG;
    myBlueText = blueBG;
    myAlphaText = alphaBG;
    [self setNeedsDisplay:YES];
}//change object color

-(void)stainColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
    NSLog(@"new object Color");
    myRedObj = redBG;
    myGreenObj = greenBG;
    myBlueObj = blueBG;
    myAlphaObj = alphaBG;
    [self setNeedsDisplay:YES];
}//change bg color

-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG{
//    NSLog(@"new background Color");
    myRedBG = redBG;
    myGreenBG = greenBG;
    myBlueBG = blueBG;
    myAlphaBG = alphaBG;
    
    [self setMyString: [myControlObj returnNTextField]];
    [myControlObj assignStringToTextField:[NSString stringWithFormat:@"R:%f,G:%f,B:%f",redBG,greenBG,blueBG]];
    
    [self setNeedsDisplay:YES];
}
//set the string
-(void)setMyString:(NSString *)pString;
{
    // prevent an NSInvalidArgumentException if pString is nil.
    if(pString) {
        myString = [[NSString alloc]initWithString:	pString];
    } else {
        myString = @"";
    } // end if
    
}// end setMyString

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
    //set background color
    [[NSColor colorWithSRGBRed:myRedBG green:myGreenBG blue:myBlueBG alpha:myAlphaBG] setFill];
     NSRectFill( dirtyRect );
    
    // draw a couple of letters, just for the craic
    // see p282 of the Hillegass: Cocoa Programming 2nd ed.
    NSMutableDictionary *zDictAttributes = [[NSMutableDictionary alloc] init];
    [zDictAttributes setObject:[NSFont fontWithName:@"Helvetica" size:20]
                        forKey:NSFontAttributeName];
    [zDictAttributes setObject:[NSColor colorWithSRGBRed:myRedText green:myGreenText blue:myBlueText alpha:myAlphaText]
                        forKey:NSForegroundColorAttributeName];
    
    NSPoint	zPoint;
    zPoint.x	= 40.0;
    zPoint.y	= 30.0;
    
    NSString * zString	= @"Harmony";
   	
    [zString drawAtPoint:zPoint withAttributes:zDictAttributes];
}

@end
