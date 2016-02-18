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
   IBOutlet id ViewControlObjectText;
    
    float myRedFill;
    float myGreenFill;
    float myBlueFill;
    float myAlphaFill;
    
    float myRedOutline;
    float myGreenOutline;
    float myBlueOutline;
    float myAlphaOutline;
    float myBoarderSize;
    
    float myRedBG;
    float myGreenBG;
    float myBlueBG;
    float myAlphaBG;
    
    float myRedText;
    float myGreenText;
    float myBlueText;
    float myAlphaText;
    
    NSString *myText;
    float mySize;
}

@property (nonatomic) float boarderSize;

-(NSString*)fillColor :(float)red :(float)green :(float)blue :(float)alpha;

-(NSString*)outlineColor :(float)red :(float)green :(float)blue :(float)alpha;

-(NSString*)bgColor :(float)red :(float)green :(float)blue :(float)alpha;

-(NSString*)textColor :(float)red :(float)green :(float)blue :(float)alpha;

-(void)BorderSize :(float)mySize;

-(void)usrText :(NSString*)Text;

-(void)textSize :(float)Size;

@end
