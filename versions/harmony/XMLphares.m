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
    
    NSLog(@"Element started:%@ attributes:%@",elementName,attributeDict);
    self.element = elementName;
    self.attributes = attributeDict;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    //  NSLog(@"Element ended %@",elementName);
    self.element = @"";
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
  //  NSLog(@"parser");
    if ([self.element isEqualToString:@"colorProfile"]) {
        self.currentAttributes = [self.attributes valueForKey:@"version"];
        self.currentVersion = self.currentAttributes.doubleValue;
        NSLog(@"current version %f", self.currentVersion);
    } else if ([self.element isEqualToString:@"textcolor" ]) {
        self.currentText = string;
      //  NSLog(@"red %f", self.currentTextRed);
    } else if ([self.element isEqualToString:@"bgcolor"]) {
        self.currentBackGround = string;
      //  NSLog(@"blue %f", self.currentTextBlue);
    } 
}
@end
