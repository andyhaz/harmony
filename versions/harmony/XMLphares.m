//
//  XMLphares.m
//  parseXML_String
//
//  Created by andrew hazlett on 1/9/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "XMLphares.h"

@implementation XMLphares

-(void)parseXML :(NSString*)xmlString{
    
    NSData *xmlData = [xmlString dataUsingEncoding:NSASCIIStringEncoding];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    [xmlParser setDelegate:self];
    
    [xmlParser parse];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
  //  NSLog(@"Element started:%@ attributes:%@",elementName,attributeDict);
    self.element = elementName;
    self.attributes = attributeDict;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //  NSLog(@"Element ended %@",elementName);
    self.element = @"";
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if ([self.element isEqualToString:@"colorProfile"]) {
        self.currentAttributes = [self.attributes valueForKey:@"version"];
        self.currentVersion = self.currentAttributes.doubleValue;
       // NSLog(@"current version %f", self.currentVersion);
    } else if ([self.element isEqualToString:@"textred" ]) {
        self.currentTextRed = string.doubleValue;
      //  NSLog(@"red %f", self.currentTextRed);
    } else if ([self.element isEqualToString:@"textblue"]) {
        self.currentTextBlue = string.doubleValue;
      //  NSLog(@"blue %f", self.currentTextBlue);
    } else if ([self.element isEqualToString:@"textgreen"]) {
        self.currentTextGreen = string.doubleValue;
       // NSLog(@"green %f", self.currentTextGreen);
    } else if ([self.element isEqualToString:@"textalpha"]) {
        self.currentTextAlpha = string.doubleValue;
      //  NSLog(@"alpha %f", self.currentTextAlpha);
    } else if ([self.element isEqualToString:@"bgred" ]) {
        self.currentBgRed = string.doubleValue;
      //  NSLog(@"bg red %f", self.currentBgRed);
    } else if ([self.element isEqualToString:@"bgblue"]) {
        self.currentTextBlue = string.doubleValue;
      //  NSLog(@"bg blue %f", self.currentTextBlue);
    } else if ([self.element isEqualToString:@"bggreen"]) {
        self.currentBgGreen = string.doubleValue;
      //  NSLog(@"bg green %f", self.currentBgGreen);
    } else if ([self.element isEqualToString:@"bgalpha"]) {
        self.currentBgAlpha = string.doubleValue;
     //   NSLog(@"bg alpha %f", self.currentBgAlpha);
    }
}
@end
