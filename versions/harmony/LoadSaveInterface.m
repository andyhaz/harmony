//
//  LoadSaveInterface.m
//  Load and save Data
//
//  Created by andrew hazlett on 3/29/15.
//  Copyright (c) 2015 andrew hazlett. All rights reserved.
//

#import "LoadSaveInterface.h"

@implementation LoadSaveInterface

-(void)saveFiledata :(NSArray*)Data{
    // get the file url
    NSSavePanel * zSavePanel = [NSSavePanel savePanel];
    NSArray * zAryOfExtensions = [NSArray arrayWithObject:@"hcp"];
    [zSavePanel setAllowedFileTypes:zAryOfExtensions];
    
    NSInteger zResult = [zSavePanel runModal];
    
    if (zResult == NSFileHandlingPanelCancelButton) {
        NSLog(@"writeUsingSavePanel cancelled");
        return;
    }
    NSURL *zUrl = [zSavePanel URL];
    
   // NSString *writeData = [NSString stringWithFormat:@"%@",stringData];
    //write
    BOOL zBoolResult = [Data writeToURL:zUrl atomically:YES];
    
  /*  BOOL zBoolResult = [Data writeToURL:zUrl
                                  atomically:YES
                                    encoding:NSASCIIStringEncoding
                                       error:NULL];*/
    if (! zBoolResult) {
        NSLog(@"writeUsingSavePanel failed");
        
    }
   // NSLog(@"saveFileSata=\n%@",writeData);
}

-(NSArray*)loadFileData{
    NSOpenPanel * zOpenPanel = [NSOpenPanel openPanel];
    NSArray * zAryOfExtensions = [NSArray arrayWithObject:@"hcp"];
    [zOpenPanel setAllowedFileTypes:zAryOfExtensions];
    
    NSInteger zIntResult = [zOpenPanel runModal];
    if (zIntResult == NSFileHandlingPanelCancelButton) {
        NSLog(@"readUsingOpenPanel cancelled");
    }
    NSURL *zUrl = [zOpenPanel URL];
    // read the file
  /*  NSString * zStr = [NSString stringWithContentsOfURL:zUrl
                                               encoding:NSASCIIStringEncoding
                                                  error:NULL];*/
    NSArray *ary = [NSArray arrayWithContentsOfURL:zUrl];
  //  NSLog(@"loadFileData=\n%@",zStr);
    return ary;
}
@end
