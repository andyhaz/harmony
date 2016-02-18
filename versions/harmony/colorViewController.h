//
//  colorViewController.h
//  harmony
//
//  Created by andrew hazlett on 2/17/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface colorViewController : NSWindowController{
    
    IBOutlet NSTextField *myFillFieldOutlet;
    IBOutlet NSTextField *myOutlineOutlet;
    IBOutlet NSTextField *myBackgoundOutlet;
    IBOutlet NSTextField *myTextOutlet;
}

@property (nonatomic,retain) NSMutableArray *myColorData;
@property (nonatomic,retain) NSMutableArray *myColorHex;

@property (weak) IBOutlet NSTextField *fillInfoField;
@property (weak) IBOutlet NSTextField *outlineInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *bgInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *textInfoFieldOutlint;

-(void)showData;

@end