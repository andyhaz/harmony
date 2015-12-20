//
//  shareControl.m
//  harmony
//
//  Created by andrew hazlett on 12/15/15.
//  Copyright © 2015 andrew hazlett. All rights reserved.
//

#import "shareControl.h"

@implementation shareControl

- (NSString *)returnNTextField {
    NSLog(@"returnNTextField");
    return(@"string from shareControl");
} // end returnNTextField

- (NSString *)returnNOutlineField{
    return(@"string from shareControl");
}
- (NSString *)returnNBGField{
    return(@"string from shareControl");
}

- (void)assignStringToTextField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

- (void)assignStringToOutlineField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

- (void)assignStringToBGField:(NSString *)pString {
    NSLog(@"shareControl %@",pString);
} // end assignStringToTextField

@end