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
    return(@"string from MyDummyControl");
} // end returnNTextField

- (void)assignStringToTextField:(NSString *)pString {
    NSLog(@"MyDummyControl %@",pString);
} // end assignStringToTextField

@end