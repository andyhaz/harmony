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
@synthesize RedBGInfoField,BlueBGInfoField,GreenBGInfoField,RedFillInfoField,BlueFillInfoField,GreenFillInfoField,RedOutlineInfoField,BlueOutlineInfoField,GreenOutlineInfoField,RedTextInfoField,BlueTextInfoField,GreenTextInfoField;
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
    
    [RedBGInfoField setStringValue:[self convertColor:myColorData[8]]];
    [BlueBGInfoField setStringValue:[self convertColor:myColorData[9]]];
    [GreenBGInfoField setStringValue:[self convertColor:myColorData[10]]];
    
    [RedFillInfoField setStringValue:[self convertColor:myColorData[0]]];
    [BlueFillInfoField setStringValue:[self convertColor:myColorData[1]]];
    [GreenFillInfoField setStringValue:[self convertColor:myColorData[2]]];
    
    [RedOutlineInfoField setStringValue:[self convertColor:myColorData[4]]];
    [BlueOutlineInfoField setStringValue:[self convertColor:myColorData[5]]];
    [GreenOutlineInfoField setStringValue:[self convertColor:myColorData[6]]];
    
    [RedTextInfoField setStringValue:[self convertColor:myColorData[12]]];
    [BlueTextInfoField setStringValue:[self convertColor:myColorData[13]]];
    [GreenTextInfoField setStringValue:[self convertColor:myColorData[14]]];

}

-(NSString*)convertColor :(NSString*)strColor{
    float colorNum = [strColor floatValue];
    float newColor = colorNum*255;
    
    return [NSString stringWithFormat:@"%f",newColor];
}

@end
