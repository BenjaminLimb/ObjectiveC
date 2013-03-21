//
//  ViewController.m
//  nsOperationExample
//
//  Created by r2d2 on 2/26/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import "ViewController.h"
#import "getJSONFromURL.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theURLDisplay;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _queue = [[NSOperationQueue alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getJSON:(id)sender {
    NSLog(@"1");
    assert(theURLDisplay.text != nil);
    
    
    getJSONFromURL *theJSONRequest = [[getJSONFromURL alloc]initWithURL:
                                      [NSURL URLWithString:
                                       [theURLDisplay text]]];
    NSLog(@"2");
    
    
    [self.queue addOperation:theJSONRequest];
    
    // run the main method from theJSONRequest
     //[theJSONRequest main];
        NSLog(@"3");
    
   
    NSLog(@"%@", theJSONRequest.JSONDictionary);
    NSLog(@"is now finished");
    
}

-(void)logResults:(NSDictionary *)JSONDictionary
{
    NSLog(@"logresults");
    
    NSLog(@"%@", JSONDictionary);
}
@end
