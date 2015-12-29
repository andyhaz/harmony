//
//  myControl.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "myControl.h"

@interface myControl (){
//    NSString *myControlString;
    NSMutableArray *saveData;
}

@end

@implementation myControl

/*
@synthesize colorWellBackground,colorWellSation,colorWellText,infoStr;

- (id)init {
    self = [super init];
    if (self) {
        NSLog(@"init mycontrol");
        saveData = [[NSMutableArray alloc]init];
      //myView *view = [[myView alloc]init];
      //[view textColor:1.0 :1.0 :1.0 :1.0];
      //[view bgColor:0.0 :0.0 :0.0 :0.0];
        [myCustomViewObjOutlet textColor:1.0 :1.0 :1.0 :1.0];
        
      //vc = [[ViewController alloc]init];
      //infoStr = [vc test:@"hello"];
      //  NSLog(@"viewControler:%@",infoStr);
    }
    return self;
}

- (IBAction)textColorWell:(id)pId{
    NSColorWell *well = colorWellText;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    [myCustomViewObjOutlet textColor:myRed :myGreen :myBlue :myAlpha];
    
    [saveData addObject:[NSString stringWithFormat:@"%f",myRed]];
    [saveData addObject:[NSString stringWithFormat:@"%f",myGreen]];
    [saveData addObject:[NSString stringWithFormat:@"%f",myBlue]];
    [saveData addObject:[NSString stringWithFormat:@"%f",myAlpha]];
    
  //  NSLog(@"viewControler saveData:%@, myCustomViewObjOutlet:%@",saveData,myCustomViewObjOutlet);
}

- (IBAction)sationColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    [myCustomViewObjOutlet outlineColor:myRed :myGreen :myBlue :myAlpha];
}

- (IBAction)backgoundColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRed = well.color.redComponent;
    float myGreen = well.color.greenComponent;
    float myBlue = well.color.blueComponent;
    float myAlpha = well.color.alphaComponent;
    
    [myCustomViewObjOutlet bgColor:myRed :myGreen :myBlue :myAlpha];
    //NSLog(@"new bg Color:%@",colorWell3.color);
}
//handly open and close
- (IBAction)doSaveAs:(id)pId; {
    NSLog(@"doSaveAs");
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    NSLog(@"save saveData:%@",saveData);
    NSString *stringData = [NSString stringWithFormat:@"%@",saveData];
    [lsi saveFileSata:stringData];
    NSLog(@"save strData:%@",stringData);
} // end doSaveAs

- (IBAction)doOpen:(id)pId; {
    NSLog(@"doOpen");
    LoadSaveInterface *lsi = [[LoadSaveInterface alloc]init];
    NSString *stringData = [lsi loadFileData];
    NSLog(@"load strData:%@",stringData);
  
} // end doOpen

//
- (NSString *)returnNTextField {
    NSString * zString = [myTextFieldOutlet stringValue];
 //NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (NSString *)returnNOutlineField {
    NSString * zString = [myStaOutlet stringValue];
  //NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (NSString *)returnNBGField {
    NSString * zString = [myBackgoundOutlet stringValue];
    //NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (void)assignStringToTextField:(NSString *)pString {
  //NSLog(@"assign string A");
    [myTextFieldOutlet setStringValue:pString];
}//end assignStringToTextField

- (void)assignStringToOutlinField:(NSString *)pString {
  //NSLog(@"assign string B");
    [myStaOutlet setStringValue:pString];
}//end assignStringToTextField

- (void)assignStringToBGField:(NSString *)pString {
 //NSLog(@"assign string C");
    [myBackgoundOutlet setStringValue:pString];
}//end assignStringToTextField

*/
@end