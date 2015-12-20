//
//  myControl.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "myControl.h"

@implementation myControl

@synthesize colorWellBackground,colorWellSation,colorWellText;

- (id)init {
    self = [super init];
    if (self) {
      //  NSLog(@"init");
        [myCustomViewObjOutlet bgColor:0.0 :0.0 :1.0 :1.0];
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

- (NSString *)returnNTextField {
    NSString * zString = [myTextFieldOutlet stringValue];
 //   NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (NSString *)returnNOutlineField {
    NSString * zString = [myStaOutlet stringValue];
    NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (NSString *)returnNBGField {
    NSString * zString = [myBackgoundOutlet stringValue];
    //   NSLog(@"return text: %@",zString);
    return zString;
}//end returnNTextField

- (void)assignStringToTextField:(NSString *)pString {
    NSLog(@"assign string A");
    [myTextFieldOutlet setStringValue:pString];
}//end assignStringToTextField

- (void)assignStringToOutlinField:(NSString *)pString {
    NSLog(@"assign string B");
    [myStaOutlet setStringValue:pString];
}//end assignStringToTextField

- (void)assignStringToBGField:(NSString *)pString {
    NSLog(@"assign string C");
    [myBackgoundOutlet setStringValue:pString];
}//end assignStringToTextField


@end