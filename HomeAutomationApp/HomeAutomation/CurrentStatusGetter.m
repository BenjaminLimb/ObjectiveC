//
//  CurrentStatusGetter.m
//  HomeAutomation
//
//  Created by r2d2 on 4/3/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "CurrentStatusGetter.h"

@implementation CurrentStatusGetter

@synthesize theURL;
@synthesize JSONDictionary;
@synthesize queue;

-(id) initWithURL:(NSURL *)aURL
{
    assert(aURL != nil);
    
    self = [super init];
    
    if (self != nil)
    {
        // ask brother barney about arrow below
        self-> theURL = [aURL copy];
        assert(theURL != nil);
    }
    
    return self;
}


-(id) initWithURL:(NSURL *)aURL andView:(UIViewController *)aView
{
    assert(aURL != nil);
    
    self = [super init];
    
    if (self != nil)
    {
        self.theURL = [aURL copy];
        assert(theURL != nil);
        self.theView = aView;
    }
    
    return self;
}



-(void)setViewController:(MainViewController *)theView
{
    assert(theView != nil);
    self.theView = theView;
}

-(void)main
{
    assert(theURL != nil);
    
    NSURLRequest *theRequest = [NSURLRequest requestWithURL:theURL];
    NSURLResponse *theResponse = nil;
    NSError *theError = nil;
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:theRequest returningResponse:&theResponse error:&theError];
    
    self.JSONDictionary = [NSJSONSerialization JSONObjectWithData:theData options:kNilOptions error:&theError];
    
    NSLog(@"from inside CurrentStatusGetter: %@", self.JSONDictionary);
    
    [_theView performSelectorOnMainThread:@selector(updateViewElements:) withObject:JSONDictionary waitUntilDone:false];
    
    
}



@end

