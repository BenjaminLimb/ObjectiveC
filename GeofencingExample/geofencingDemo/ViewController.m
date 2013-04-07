//
//  ViewController.m
//  geofencingDemo
//
//  Created by r2d2 on 4/2/13.
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

    // initialize the location manager
    [self initializeLocationManager];
    
    // initialize the nsdictionary holding the location info
    _theLocation = [self initializeLocations];
    
    [self mapDictionaryToRegion:_theLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeLocationManager {
    // Check to ensure location services are enabled
    if(![CLLocationManager locationServicesEnabled]) {
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You need to enable location services to use this app." delegate:self cancelButtonTitle:@"Hide" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
        
        return;
        }
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
}

- (CLRegion*)mapDictionaryToRegion:(NSDictionary*)dictionary {
    NSString *title = [dictionary valueForKey:@"title"];
    
    CLLocationDegrees latitude = [[dictionary valueForKey:@"latitude"] doubleValue];
    CLLocationDegrees longitude =[[dictionary valueForKey:@"longitude"] doubleValue];
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
    
    CLLocationDistance regionRadius = [[dictionary valueForKey:@"radius"] doubleValue];
    
    return [[CLRegion alloc] initCircularRegionWithCenter:centerCoordinate
                                                   radius:regionRadius
                                               identifier:title];
}

- (NSDictionary*)initializeLocations
{
    NSDictionary *locations = @{
                                @"title" : @"ios class",
                                @"latitude" : [NSNumber numberWithFloat:43.818969],
                                @"longitude" : [NSNumber numberWithFloat:-111.781543],
                                @"radius" : [NSNumber numberWithFloat:10]
                                };
    
    return locations;
     
}



@end
