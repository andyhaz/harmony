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
@property double textRed;
@property double textBlue;
@property double textGreen;
@property double textAlpha;
@property double bgRed;
@property double bgBlue;
@property double bgGreen;
@property double bgAlpha;

@property double currentVersion;
@property double currentTextRed;
@property double currentTextBlue;
@property double currentTextGreen;
@property double currentTextAlpha;
@property double currentBgRed;
@property double currentBgBlue;
@property double currentBgGreen;
@property double currentBgAlpha;

-(void)parseXML :(NSString*)xmlString;

@end

