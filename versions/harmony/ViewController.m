//
//  ViewController.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    colorViewController *cvc;
}

@property (retain) NSMutableArray *colorData;
@property (retain) NSMutableArray *hexData;
@property (nonatomic) float borderSizeData;

@end

@implementation ViewController

@synthesize colorData,colorWellBackground,colorWellFill,colorWellOutline,colorWelltext,hexData;
@synthesize borderSizeOutLine,usrTestOutline,borderSizeData;

- (void)viewDidLoad {
    [super viewDidLoad];
    borderSizeData = 3.0;
    
    colorData = [[NSMutableArray alloc] initWithObjects:@"1.0",@"1.0",@"1.0",@"1.0",@"1.0",@"0.0",@"0.0",@"1.0",@"0.0",@"0.0",@"0.0",@"1.0",@"0.0",@"1.0",@"0.0",@"1.0", nil];
    NSString *fillColorHex =  [myCustomViewObjOutlet fillColor:1.0 :1.0 :1.0 :1.0];
    NSString *objOutlineHex = [myCustomViewObjOutlet outlineColor:0.0 :0.0 :1.0 :1.0];
    NSString *bgColorHex = [myCustomViewObjOutlet bgColor:0.0 :0.0 :0.0 :1.0];
    NSString *textColorHex = [myCustomViewObjOutlet textColor:0.0 :1.0 :0.0 :1.0];
    
    hexData = [[NSMutableArray alloc] initWithObjects:fillColorHex,objOutlineHex,bgColorHex,textColorHex, nil ];
   
    [myCustomViewObjOutlet usrText:@"Harmony"];

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    //Update the view, if already loaded.
}

- (IBAction)fillColorWell:(id)pId{
    NSColorWell *well = colorWellFill;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
     NSString *ColorHex = [myCustomViewObjOutlet fillColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:2 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:3 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    
  //  NSLog(@"viewControler colorData:%@, myCustomViewObjOutlet:%@",colorData,myCustomViewObjOutlet);
    [hexData replaceObjectAtIndex:0 withObject:ColorHex];
    [self updateDisplay];
}

- (IBAction)outlineColorWell:(id)pId{
    NSColorWell *well = colorWellOutline;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    NSString *ColorHex = [myCustomViewObjOutlet outlineColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:4 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:5 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:6 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:7 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    [colorData replaceObjectAtIndex:16 withObject:[NSString stringWithFormat:@"%f",borderSizeData]];

    
    [hexData replaceObjectAtIndex:1 withObject:ColorHex];

    [self updateDisplay];
}

- (IBAction)backgoundColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    NSString *ColorHex = [myCustomViewObjOutlet bgColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:8 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:9 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:10 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:11 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    
    [hexData replaceObjectAtIndex:2 withObject:ColorHex];
    
    [self updateDisplay];
}
- (IBAction)textColorWell:(id)pId{
    NSColorWell *well = colorWelltext;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    NSString *ColorHex = [myCustomViewObjOutlet textColor:myRed :myGreen :myBlue :myAlpha];
    
    [colorData replaceObjectAtIndex:12 withObject:[NSString stringWithFormat:@"%f",myRed]];
    [colorData replaceObjectAtIndex:13 withObject:[NSString stringWithFormat:@"%f",myGreen]];
    [colorData replaceObjectAtIndex:14 withObject:[NSString stringWithFormat:@"%f",myBlue]];
    [colorData replaceObjectAtIndex:15 withObject:[NSString stringWithFormat:@"%f",myAlpha]];
    
    [hexData replaceObjectAtIndex:3 withObject:ColorHex];
    
    [self updateDisplay];
}

- (IBAction)borderSize:(id)sender {
  borderSizeData = [borderSizeOutLine intValue];
  [myCustomViewObjOutlet BorderSize:borderSizeData];
}

- (IBAction)usrText:(id)sender {
    [myCustomViewObjOutlet usrText:[usrTestOutline stringValue]];
}
//handly menu
- (IBAction)colorWindow:(id)sender {
   // NSLog(@"hex Data:%@ colordata:%@",hexData,colorData);
    [self openColorWindow];
}

- (void)openColorWindow {
    if (!cvc) {
        cvc = [[colorViewController alloc] initWithWindowNibName:@"colorViewController"];
    }
    [cvc showWindow:self];
    [self updateDisplay];
}

-(void)updateDisplay {
    //    NSLog(@"hex Data:%@ colordata:%@",hexData,colorData);
    [cvc setMyColorHex:hexData];
    [cvc setMyColorData:colorData];
    if (hexData || colorData)  [cvc showData];
}

- (IBAction)SaveMenu:(id)sender; {
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    [lsi saveFiledata:colorData];
   // NSLog(@"save strData:%@",stringData);
} // end

- (IBAction)textSize:(id)sender {
    
}

- (IBAction)OpenMenu:(id)sender; {
  //  NSLog(@"openMenu");
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    [colorData removeAllObjects];
    colorData = [[NSMutableArray alloc] initWithArray:[lsi loadFileData]];
  //  NSLog(@"load colorData:%@",colorData);
  
    float myRedFill = [[colorData objectAtIndex:0] floatValue];
    float myGreenFill = [[colorData objectAtIndex:1] floatValue];
    float myBlueFill = [[colorData objectAtIndex:2] floatValue];
    float myAlphaFill = [[colorData objectAtIndex:3] floatValue];
    
    float myRedOutline = [[colorData objectAtIndex:4] floatValue];
    float myGreenOutline = [[colorData objectAtIndex:5] floatValue];
    float myBlueOutline = [[colorData objectAtIndex:6] floatValue];
    float myAlphaOutline = [[colorData objectAtIndex:7] floatValue];
    
    float myRedBG = [[colorData objectAtIndex:8] floatValue];
    float myGreenBG = [[colorData objectAtIndex:9] floatValue];
    float myBlueBG = [[colorData objectAtIndex:10] floatValue];
    float myAlphaBG = [[colorData objectAtIndex:11] floatValue];
    
    float myRedText = [[colorData objectAtIndex:12] floatValue];
    float myGreenText = [[colorData objectAtIndex:13] floatValue];
    float myBlueText = [[colorData objectAtIndex:14] floatValue];
    float myAlphaText = [[colorData objectAtIndex:15] floatValue];
    
    NSString *fillColorHex =  [myCustomViewObjOutlet fillColor:myRedFill :myGreenFill :myBlueFill :myAlphaFill];
    NSString *objOutlineHex =  [myCustomViewObjOutlet outlineColor:myRedOutline :myGreenOutline :myBlueOutline :myAlphaOutline];
    NSString *bgColorHex =  [myCustomViewObjOutlet bgColor:myRedBG :myGreenBG :myBlueBG :myAlphaBG];
    NSString *textColorHex = [myCustomViewObjOutlet textColor:myRedText :myGreenText :myBlueText :myAlphaText];
    
    hexData = [[NSMutableArray alloc] initWithObjects:fillColorHex,objOutlineHex,bgColorHex,textColorHex, nil ];

} // end

- (void)assignStringToFillField:(NSString *)pString {
    [colorData addObject:pString];
}//end

- (NSString *)returnNFillField {
    return [myFillFieldOutlet stringValue];
}//end returnNTextField

- (void)assignStringToOutlineField:(NSString *)pString{
    [colorData addObject:pString];
}

- (NSString *)returnNOutlineField{
   return [myOutlineOutlet stringValue];
}

- (void)assignStringToBGField:(NSString *)pString {
    [colorData addObject:pString];
}//end assignStringToTextField

- (NSString *)returnNBGField {
    return  [myBackgoundOutlet stringValue];
}//end returnNTextField

- (void)assignStringToTextField:(NSString *)pString {
    [colorData addObject:pString];
} // end assignStringToTextField

- (NSString *)returnNTextField{
//NSLog(@"text");
    return [myTextOutlet stringValue];
}
@end