//
//  colorViewController.m
//  harmony
//
//  Created by andrew hazlett on 2/17/16.
//  Copyright © 2016 andrew hazlett. All rights reserved.
//

#import "colorViewController.h"

@interface colorViewController ()

@end

@implementation colorViewController

@synthesize myData;

- (void)windowDidLoad {
    [super windowDidLoad];
    if (!myData) myData = [[NSMutableArray alloc]init];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

-(void)showData {
    NSLog(@"show data array:%@",myData);
}

@end
