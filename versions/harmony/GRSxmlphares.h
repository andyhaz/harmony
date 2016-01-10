//
//  GRSxmlphares.h
//  harmony
//
//  Created by andrew hazlett on 1/8/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLphares.h"

@interface GRSxmlphares : NSObject

-(NSString*)saveXMLdata :(NSMutableArray*)data;
-(NSMutableArray*)loadXMLdata :(NSString*)strData;

@end
