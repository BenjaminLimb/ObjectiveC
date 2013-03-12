//
//  ViewController.m
//  JSONtest
//
//  Created by r2d2 on 2/14/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)send:(id)sender {
    
    // beginning of edit
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://sandbox.markmccann.me/objective-c/json.php"]];
    NSURLResponse *theResponse = nil;
    NSError *theError = nil;
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:request returningResponse:&theResponse error:&theError];
    
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:theData options:kNilOptions error:&theError];
    NSLog(@"%@", JSONDictionary);
        
    _doorDisplay.text = JSONDictionary [@"doors"];
    _garageDisplay.text = JSONDictionary [@"garage"];
    _lightsDisplay.text = JSONDictionary [@"lights"];
    _thermoDisplay.text = JSONDictionary [@"thermo"];
    
}
- (IBAction)post:(id)sender {
    
    NSURL *aUrl = [NSURL URLWithString:@"http://sandbox.markmccann.me/objective-c/json.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    [request setHTTPMethod:@"POST"];
    
    // manually change these values before sending them 
    NSString *postString = @"action={\"lights\":\"on\",\"doors\":\"unlocked\",\"thermo\":\"90\",\"garage\":\"closed\"}";
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    // implement threading here
    
    //sends the request
    [NSURLConnection sendSynchronousRequest: request returningResponse: nil error: nil];
    
    
    
    NSLog(@"%@",request);
}
@end
