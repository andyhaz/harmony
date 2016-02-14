//
//  myView.h
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import "shareControl.h"
#import "colorUtitle.h"

@interface myView : NSView {
   IBOutlet id ViewControlObjectFill;
   IBOutlet id ViewControlObjectOutline;
   IBOutlet id ViewControlObjectBG;
    
    NSString *myFillString,*myOutLineString,*myBackgoundString;
    
    float myRedFill;
    float myGreenFill;
    float myBlueFill;
    float myAlphaFill;
    
    float myRedOutline;
    float myGreenOutline;
    float myBlueOutline;
    float myAlphaOutline;
    
    float myRedBG;
    float myGreenBG;
    float myBlueBG;
    float myAlphaBG;
}

-(void)fillColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;

-(void)outlineColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;

-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;
//-(void)bgColorHex:(NSString*)hex;

@end
