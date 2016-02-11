//
//  ViewController.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    //NSString *myControlString;
}

@property (retain) NSMutableArray *colorData;

@end

@implementation ViewController

@synthesize colorData,colorWellBackground,colorWellText,textInfoFieldOutlet,bgInfoFieldOutlet;

- (void)viewDidLoad {
    [super viewDidLoad];
    colorData = [[NSMutableArray alloc] initWithObjects:@"1.0",@"1.0",@"1.0",@"1.0",@"0.0",@"0.0",@"0.0",@"1.0", nil];
    [myCustomViewObjOutlet textColor:1.0 :1.0 :1.0 :1.0];
    [myCustomViewObjOutlet bgColor:0.0 :0.0 :0.0 :1.0];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)textColorWell:(id)pId{
    NSColorWell *well = colorWellText;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    [myCustomViewObjOutlet textColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    
  //  NSLog(@"viewControler colorData:%@, myCustomViewObjOutlet:%@",colorData,myCustomViewObjOutlet);
}

- (IBAction)backgoundColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    [myCustomViewObjOutlet bgColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:4 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:5 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:6 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:7 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    //NSLog(@"new bg Color:%@",colorWell3.color);
}
//handly menu
- (IBAction)MeinMenuWindo:(id)sender{
  //  NSLog(@"open mainWindow");//
    NSWindowController *winCon = [[NSWindowController alloc] initWithWindowNibName:@"mainWindow"];
    [winCon showWindow:self];
}
//handly menu
- (IBAction)SaveMenu:(id)sender; {
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    [lsi saveFiledata:colorData];
   // NSLog(@"save strData:%@",stringData);
} // end

- (IBAction)OpenMenu:(id)sender; {
  //  NSLog(@"openMenu");
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    colorData = [[NSMutableArray alloc] initWithArray:[lsi loadFileData]];
  //  NSLog(@"load colorData:%@",colorData);
  
    float myRedText = [[colorData objectAtIndex:0] floatValue];
    float myGreenText = [[colorData objectAtIndex:1] floatValue];
    float myBlueText = [[colorData objectAtIndex:2] floatValue];
    float myAlphaText = [[colorData objectAtIndex:3] floatValue];
    float myRedBG = [[colorData objectAtIndex:4] floatValue];
    float myGreenBG = [[colorData objectAtIndex:5] floatValue];
    float myBlueBG = [[colorData objectAtIndex:6] floatValue];
    float myAlphaBG = [[colorData objectAtIndex:7] floatValue];
    
    [myCustomViewObjOutlet textColor:myRedText :myGreenText :myBlueText :myAlphaText];
    [myCustomViewObjOutlet bgColor:myRedBG :myGreenBG :myBlueBG :myAlphaBG];
} // end

- (void)assignStringToTextField:(NSString *)pString {
 //   NSLog(@"assign string A");
    [colorData addObject:pString];
    [myTextFieldOutlet setStringValue:pString];
}//end assignStringToTextField

- (NSString *)returnNTextField {
    NSString * zString = [myTextFieldOutlet stringValue];
   // NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField
//
- (void)assignStringToBGField:(NSString *)pString {
    //NSLog(@"assign string C");
    [myBackgoundOutlet setStringValue:pString];
}//end assignStringToTextField

- (NSString *)returnNBGField {
    NSString * zString = [myBackgoundOutlet stringValue];
    
    return zString;
}//end returnNTextField

- (IBAction)textAction:(id)sender {
    NSString *textStr = [textInfoFieldOutlet stringValue];
    colorUtitle *colorUtl = [[colorUtitle alloc]init];
    NSColor *newColor =  [colorUtl colorFromHexString:textStr];
    NSColorWell *well = colorWellText;

    
    float myRed = newColor.redComponent;
    float myGreen = newColor.greenComponent;
    float myBlue = newColor.blueComponent;
    float myAlpha = newColor.alphaComponent;
    
    NSColor *newcolor = [NSColor colorWithCalibratedRed:myRed green:myGreen blue:myBlue alpha:myAlpha];
    [well setColor:newcolor];
    
    [myCustomViewObjOutlet textColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
  //  NSLog(@"text action:%@",newColor);
}

- (IBAction)bgAction:(id)sender {
    NSString *textStr = [textInfoFieldOutlet stringValue];
    colorUtitle *colorUtl = [[colorUtitle alloc]init];
    NSColor *newColor =  [colorUtl colorFromHexString:textStr];
    NSColorWell *well = colorWellBackground;

    float myRed = newColor.redComponent;
    float myGreen = newColor.greenComponent;
    float myBlue = newColor.blueComponent;
    float myAlpha = newColor.alphaComponent;
    
    NSColor *newcolor = [NSColor colorWithCalibratedRed:myRed green:myGreen blue:myBlue alpha:myAlpha];
    [well setColor:newcolor];
    
    [myCustomViewObjOutlet bgColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:4 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:5 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:6 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:7 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    //NSLog(@"bg action");
}
@end
