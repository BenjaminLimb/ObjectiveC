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
   
    if(theURLDisplay.text != nil)
    {
        // an instance of theJSONRequest that will get a JSON object from the a given URL
        getJSONFromURL *theJSONRequest = [[getJSONFromURL alloc]initWithURL:[NSURL URLWithString:[theURLDisplay text]] andView:self];
    
        // add the operation to the queue
        [self.queue addOperation:theJSONRequest];
    }
}

-(void)logResults:(NSDictionary *)JSONDictionary{

    NSLog(@"logresults");
    
    NSLog(@"from the view: %@", JSONDictionary);
    
    _lightsDisplay.text = [JSONDictionary objectForKey:@"lights"];
    
}
@end
