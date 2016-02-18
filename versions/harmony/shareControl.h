//
//  shareControl.h
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareControl : NSObject

- (NSString *)returnNFillField;
- (NSString *)returnNOutlineField;
- (NSString *)returnNBGField;
- (NSString *)returnNTextField;

- (void)assignStringToFillField:(NSString *)pString;
- (void)assignStringToOutlineField:(NSString *)pString;
- (void)assignStringToBGField:(NSString *)pString;
- (void)assignStringToTextField:(NSString *)pString;

@end