//
//  shareControl.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "shareControl.h"

@implementation shareControl

- (NSString *)returnNFillField {
    NSLog(@"returnNTextField");
    return(@"string from shareControl");
} // end returnNFillField

- (NSString *)returnNOutlineField{
    return(@"string from shareControl");
}

- (NSString *)returnNBGField{
    return(@"string from shareControl");
}

- (NSString *)returnNTextField{
    return(@"string from shareControl");
}

- (void)assignStringToFillField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

- (void)assignStringToOutlineField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

- (void)assignStringToBGField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

- (void)assignStringToTextField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

@end