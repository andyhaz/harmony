//
//  shareControl.h
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareControl : NSObject

- (NSString *)returnNTextField;
- (NSString *)returnNOutlineField;
- (NSString *)returnNBGField;

- (void)assignStringToTextField:(NSString *)pString;
- (void)assignStringToOutlineField:(NSString *)pString;
- (void)assignStringToBGField:(NSString *)pString;

@end