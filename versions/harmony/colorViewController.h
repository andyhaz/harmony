//
//  colorViewController.h
//  harmony
//
//  Created by andrew hazlett on 2/17/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface colorViewController : NSWindowController

@property (nonatomic,retain) NSMutableArray *myColorData;
@property (nonatomic,retain) NSMutableArray *myColorHex;

@property (weak) IBOutlet NSTextField *fillInfoField;
@property (weak) IBOutlet NSTextField *outlineInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *bgInfoFieldOutlet;
@property (weak) IBOutlet NSTextField *textInfoFieldOutlint;

@property (weak) IBOutlet NSTextField *RedBGInfoField;
@property (weak) IBOutlet NSTextField *BlueBGInfoField;
@property (weak) IBOutlet NSTextField *GreenBGInfoField;

@property (weak) IBOutlet NSTextField *RedFillInfoField;
@property (weak) IBOutlet NSTextField *BlueFillInfoField;
@property (weak) IBOutlet NSTextField *GreenFillInfoField;

@property (weak) IBOutlet NSTextField *RedOutlineInfoField;
@property (weak) IBOutlet NSTextField *BlueOutlineInfoField;
@property (weak) IBOutlet NSTextField *GreenOutlineInfoField;

@property (weak) IBOutlet NSTextField *RedTextInfoField;
@property (weak) IBOutlet NSTextField *BlueTextInfoField;
@property (weak) IBOutlet NSTextField *GreenTextInfoField;

-(void)showData;

@end