//
//  ViewController.h
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import "myView.h"
#import "LoadSaveInterface.h"
#import "GRSxmlphares.h"
#import "colorUtitle.h"
#import "colorViewController.h"

@interface ViewController : NSViewController {    
    IBOutlet myView *myCustomViewObjOutlet;
    IBOutlet NSPopUpButton *textsizeOutlet;
    
    IBOutlet NSTextField *myFillFieldOutlet;
    IBOutlet NSTextField *myOutlineOutlet;
    IBOutlet NSTextField *myBackgoundOutlet;
    IBOutlet NSTextField *myTextOutlet;
}

- (IBAction)fillColorWell:(id)pId;
- (IBAction)outlineColorWell:(id)pId;
- (IBAction)backgoundColorWell:(id)pId;
- (IBAction)textColorWell:(id)pId;

- (IBAction)borderSize:(id)sender;
@property (readwrite,assign) IBOutlet NSSlider *borderSizeOutLine;

- (IBAction)usrText:(id)sender;
@property (weak) IBOutlet NSTextField *usrTestOutline;

- (IBAction)textSize:(id)sender;

- (IBAction)boxToggleAction:(id)sender;
@property (weak) IBOutlet NSButton *boxToggleOutlet;

- (IBAction)textToggleAction:(id)sender;
@property (weak) IBOutlet NSButton *textToggleOutlet;


- (IBAction)OpenMenu:(id)sender;
- (IBAction)SaveMenu:(id)sender;
- (IBAction)colorWindow:(id)sender;

@property (weak) IBOutlet NSColorWell *colorWellFill;
@property (weak) IBOutlet NSColorWell *colorWellOutline;
@property (weak) IBOutlet NSColorWell *colorWellBackground;
@property (weak) IBOutlet NSColorWell *colorWelltext;

- (NSString *)returnNFillField;
- (NSString *)returnNOutlineField;
- (NSString *)returnNBGField;
- (NSString *)returnNTextField;

- (void)assignStringToFillField:(NSString *)pString;
- (void)assignStringToOutlineField:(NSString *)pString;
- (void)assignStringToBGField:(NSString *)pString;
- (void)assignStringToTextField:(NSString *)pString;

@property (weak) NSString *infoStr;

@end