//
//  colorViewController.m
//  harmony
//
//  Created by andrew hazlett on 2/17/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "colorViewController.h"

@interface colorViewController ()

@end

@implementation colorViewController

@synthesize myColorData,myColorHex;
@synthesize fillInfoField,outlineInfoFieldOutlet,bgInfoFieldOutlet,textInfoFieldOutlint;

- (void)windowDidLoad {
    [super windowDidLoad];
// Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    myColorData = [[NSMutableArray alloc]init];
    myColorHex = [[NSMutableArray alloc]init];
}

-(void)showData {
 //   NSLog(@"show data");

    [bgInfoFieldOutlet setStringValue:myColorHex[2]];
    [fillInfoField setStringValue:myColorHex[0]];
    [outlineInfoFieldOutlet setStringValue:myColorHex[1]];
    [textInfoFieldOutlint setStringValue:myColorHex[3]];
    //NSLog(@"%@ - %@",myColorData,myColorHex);
}

@end
