//
//  XMLphares.h
//  parseXML_String
//
//  Created by andrew hazlett on 1/9/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLphares : NSObject <NSXMLParserDelegate>

@property NSDictionary *attributes;
@property(retain,nonatomic)NSString *colorProfile;
//  @property(retain,nonatomic)NSString *currentElement;
//@property(retain,nonatomic)NSString *currentattribute;

@property NSString *currentAttributes;
@property NSString *currentName;
@property NSString *element;

@property double version;
@property NSString *text;
@property NSString *backGround;


@property double currentVersion;
@property NSString *currentText;
@property NSString *currentBackGround;

-(void)parseXML :(NSString*)xmlString;

@end

