//
//  getJSONFromURL.m
//  nsOperationExample
//
//  Created by r2d2 on 3/7/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import "getJSONFromURL.h"

@implementation getJSONFromURL
@synthesize theURL;
@synthesize JSONDictionary;


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



-(void)setViewController:(ViewController *)theView
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
    
    NSLog(@"from inside the NSOperation: %@", self.JSONDictionary);
    
    [_theView performSelectorOnMainThread:@selector(logResults:) withObject:JSONDictionary waitUntilDone:false];
    
    
}



@end
