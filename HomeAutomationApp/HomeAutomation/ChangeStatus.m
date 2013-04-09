//
//  ChangeStatus.m
//  HomeAutomation
//
//  Created by r2d2 on 4/3/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "ChangeStatus.h"

@implementation ChangeStatus

@synthesize theURL;
@synthesize JSONDictionary;
@synthesize queue;
@synthesize lights;
@synthesize doors;
@synthesize temp;

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

-(void)main{
    NSLog(@"start changeStatus");
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:theURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    
    NSMutableString *postString = [[NSMutableString alloc]init];
    
    [postString appendString:@"action={\"lights\":\""];
    [postString appendString:lights];
    [postString appendString:@"\",\"doors\":\""];
    [postString appendString:doors];
    [postString appendString:@"\"}"];
    
    NSLog(@"the postString: %@", postString);
    
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        
    //sends the request
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    [_theView performSelectorOnMainThread:@selector(getCurrentStatus) withObject:nil waitUntilDone:false];
    
}



@end






// @"action={\"lights\":\"on\",\"doors\":\"unlocked\",\"thermo\":\"90\",\"garage\":\"closed\"}";

// manually change these values before sending them
// NSString *postString = @"action={\"lights\":\"on\",\"doors\":\"unlocked\",\"thermo\":\"90\",\"garage\":\"closed\"}";
