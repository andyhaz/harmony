//
//  GRSxmlphares.m
//  harmony
//
//  Created by andrew hazlett on 1/8/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "GRSxmlphares.h"

@implementation GRSxmlphares

-(NSString*)saveXMLdata :(NSMutableArray*)data {
    NSString *xmlFormate = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><colorProfile version=\"1.0\"> <textred>%f</textred> <textblue>%f</textblue> <textgreen>%f</textgreen><textalpha>%f</textalpha><bgred>%f</bgred><bgblue>%f</bgblue><bggreen>%f </bggreen><bgalpha>%f</bgalpha></colorProfile>",[data[0] doubleValue],[data[1] doubleValue],[data[2] doubleValue],[data[3] doubleValue],[data[4] doubleValue],[data[5] doubleValue],[data[6] doubleValue],[data[7] doubleValue]];
  //NSLog(@"%@",xmlFormate);
   return xmlFormate;
}

-(NSMutableArray*)loadXMLdata :(NSString*)strData {
    NSMutableArray *xmlArray = [[NSMutableArray alloc]init];
    
    // Parse the XML into a dictionary
    XMLphares *xmlInfo = [[XMLphares alloc]init];
    [xmlInfo parseXML :strData];
    NSLog(@"xmlInfo:%@",xmlInfo);
    
    if (xmlInfo.version <= 1.0) {
        NSLog(@"version");
        NSNumber *redNum= [NSNumber numberWithFloat:xmlInfo.currentTextRed];
        [xmlArray addObject:redNum];
        NSNumber *blueNum= [NSNumber numberWithFloat:xmlInfo.currentTextBlue];
        [xmlArray addObject:blueNum];
        NSNumber *greenNum= [NSNumber numberWithFloat:xmlInfo.currentTextGreen];
        [xmlArray addObject:greenNum];
        NSNumber *alphaNum= [NSNumber numberWithFloat:xmlInfo.currentTextAlpha];
        [xmlArray addObject:alphaNum];
        NSNumber *redBGNum= [NSNumber numberWithFloat:xmlInfo.currentBgRed];
        [xmlArray addObject:redBGNum];
        NSNumber *blueBGNum= [NSNumber numberWithFloat:xmlInfo.currentBgBlue];
        [xmlArray addObject:blueBGNum];
        NSNumber *greenBGNum= [NSNumber numberWithFloat:xmlInfo.currentBgGreen];
        [xmlArray addObject:greenBGNum];
        NSNumber *alphaBGNum= [NSNumber numberWithFloat:xmlInfo.currentBgAlpha];
        [xmlArray addObject:alphaBGNum];
    } else {
        [xmlArray addObjectsFromArray:[strData componentsSeparatedByString:@","]];
    }
    return xmlArray;
}
@end