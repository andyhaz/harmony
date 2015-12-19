//
//  myControl.h
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//
#import <Cocoa/Cocoa.h>
//#import <Foundation/Foundation.h>
#import "myView.h"

@interface myControl : NSObject{
    IBOutlet myView *myCustomViewObjOutlet;
    IBOutlet NSTextField *BGTextFieldOutlet;
    IBOutlet NSTextField *TextFieldOutlet;
    IBOutlet NSTextField *SationTextFieldOutlet;
    
    IBOutlet NSTextField *myTextFieldOutlet;


}

- (IBAction)textColorWell:(id)pId;
- (IBAction)sationColorWell:(id)pId;
- (IBAction)backgoundColorWell:(id)pId;

@property (weak) IBOutlet NSColorWell *colorWellText;
@property (weak) IBOutlet NSColorWell *colorWellSation;
@property (weak) IBOutlet NSColorWell *colorWellBackground;

- (NSString *)returnNTextField;
- (void)assignStringToTextField:(NSString *)pString;

@end