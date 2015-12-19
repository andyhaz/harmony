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

@interface myView : NSView {
    IBOutlet id myControlObj;
    
    NSString *myString;
    
    float myRedText;
    float myGreenText;
    float myBlueText;
    float myAlphaText;
    
    float myRedObj;
    float myGreenObj;
    float myBlueObj;
    float myAlphaObj;
    
    float myRedBG;
    float myGreenBG;
    float myBlueBG;
    float myAlphaBG;
}

-(void)textColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;
-(void)stainColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;
-(void)bgColor :(float)redBG :(float)greenBG :(float)blueBG :(float)alphaBG;

@end
