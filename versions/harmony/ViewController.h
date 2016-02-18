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

    IBOutlet NSTextField *myFillFieldOutlet;
    IBOutlet NSTextField *myOutlineOutlet;
    IBOutlet NSTextField *myBackgoundOutlet;
    IBOutlet NSTextField *myTextOutlet;
}

//@property (weak) IBOutlet NSTextField *textFeildOutlet;

- (IBAction)fillColorWell:(id)pId;
- (IBAction)outlineColorWell:(id)pId;
- (IBAction)backgoundColorWell:(id)pId;
- (IBAction)textColorWell:(id)pId;

- (IBAction)OpenMenu:(id)sender;
- (IBAction)SaveMenu:(id)sender;
- (IBAction)colorWindow:(id)sender;

- (IBAction)MeinMenuWindo:(id)sender;

@property (weak) IBOutlet NSTextField *fillInfoField;
@property (weak) IBOutlet NSTextField *outlineInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *bgInfoFieldOutlet;

//- (IBAction)textAction:(id)sender;
//- (IBAction)bgAction:(id)sender;

@property (weak) IBOutlet NSColorWell *colorWellFill;
@property (weak) IBOutlet NSColorWell *colorWellOutline;
@property (weak) IBOutlet NSColorWell *colorWellBackground;
@property (weak) IBOutlet NSColorWell *colorWelltext;

- (NSString *)returnNFillField;
- (NSString *)returnNOutlineField;
- (NSString *)returnNBGField;

- (void)assignStringToFillField:(NSString *)pString;
- (void)assignStringToOutlineField:(NSString *)pString;
- (void)assignStringToBGField:(NSString *)pString;

@property (weak) NSString *infoStr;

@end