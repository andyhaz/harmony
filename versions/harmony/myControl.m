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
        NSLog(@"init");
        [myCustomViewObjOutlet bgColor:0.0 :0.0 :1.0 :1.0];
        
    }
    return self;
}

- (IBAction)textColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRedBG = well.color.redComponent;
    float myGreenBG = well.color.greenComponent;
    float myBlueBG = well.color.blueComponent;
    float myAlphaBG = well.color.alphaComponent;
    
    [myCustomViewObjOutlet textColor:myRedBG :myGreenBG :myBlueBG :myAlphaBG];
}

- (IBAction)sationColorWell:(id)pId{
    
}

- (IBAction)backgoundColorWell:(id)pId{
    NSColorWell *well = colorWellBackground;
    float myRedBG = well.color.redComponent;
    float myGreenBG = well.color.greenComponent;
    float myBlueBG = well.color.blueComponent;
    float myAlphaBG = well.color.alphaComponent;
    
    [myCustomViewObjOutlet bgColor:myRedBG :myGreenBG :myBlueBG :myAlphaBG];
    //NSLog(@"new bg Color:%@",colorWell3.color);
}

- (NSString *)returnNTextField {
    NSString * zString = [myTextFieldOutlet stringValue];
    //  NSLog(@"return text: %@",zString);
    return zString;
} // end returnNTextField

- (void)assignStringToTextField:(NSString *)pString {
    //   NSLog(@"assign string");
    [myTextFieldOutlet setStringValue:pString];
} // end assignStringToTextField


@end