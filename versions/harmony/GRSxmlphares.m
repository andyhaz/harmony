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
    NSString *xmlFormate = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><colorProfile version=\"1.0\"><textcolor>%@</textcolor><bgcolor>%@</bgcolor></colorProfile>",data[0],data[1]];
  //NSLog(@"%@",xmlFormate);
   return xmlFormate;
}

-(NSMutableArray*)loadXMLdata :(NSString*)strData {
    NSMutableArray *xmlArray = [[NSMutableArray alloc]init];
    // Parse the XML into a dictionary
    XMLphares *xmlInfo = [[XMLphares alloc]init];
    [xmlInfo parseXML :strData];
    NSLog(@"xmlInfo:%f",xmlInfo.currentVersion);
    if (xmlInfo.currentVersion == 1.0) {
      //  NSLog(@"version");
        NSString *tcolor = xmlInfo.currentText;
        NSLog(@"text color:%@",tcolor);
        
        [xmlArray addObject:tcolor];
        NSString *bgcolor = xmlInfo.currentBackGround;
        NSLog(@"BG color:%@",bgcolor);
        
        [xmlArray addObject:bgcolor];
        } else {
        [xmlArray addObjectsFromArray:[strData componentsSeparatedByString:@","]];
    }
    NSLog(@"loadXMLdata xmlArray:%@",xmlArray);
    return xmlArray;
}
@end