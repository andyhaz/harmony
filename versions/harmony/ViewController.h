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

@interface ViewController : NSViewController {    
    IBOutlet myView *myCustomViewObjOutlet;

    IBOutlet NSTextField *myFillFieldOutlet;
    IBOutlet NSTextField *myOutlineOutlet;
    IBOutlet NSTextField *myBackgoundOutlet;
}

//@property (weak) IBOutlet NSTextField *textFeildOutlet;

//- (IBAction)textColorWell:(id)pId;
- (IBAction)fillColorWell:(id)pId;
- (IBAction)outlineColorWell:(id)pId;
- (IBAction)backgoundColorWell:(id)pId;

- (IBAction)OpenMenu:(id)sender;
- (IBAction)SaveMenu:(id)sender;

- (IBAction)MeinMenuWindo:(id)sender;

 @property (weak) IBOutlet NSTextField *outlineInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *fillInfoFieldOutlet;
 @property (weak) IBOutlet NSTextField *bgInfoFieldOutlet;

- (IBAction)textAction:(id)sender;
- (IBAction)bgAction:(id)sender;

@property (weak) IBOutlet NSColorWell *colorWellFill;
@property (weak) IBOutlet NSColorWell *colorWellOutline;
@property (weak) IBOutlet NSColorWell *colorWellBackground;

- (NSString *)returnNTextField;
- (NSString *)returnNBGField;

- (void)assignStringToTextField:(NSString *)pString;
- (void)assignStringToBGField:(NSString *)pString;

@property (weak) NSString *infoStr;

@end

