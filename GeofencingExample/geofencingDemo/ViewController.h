//
//  ViewController.h
//  geofencingDemo
//
//  Created by r2d2 on 4/2/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (strong)CLLocationManager *locationManager;
@property (strong)NSDictionary *theLocation;

- (void)initializeLocationManager;
- (NSDictionary*)initializeLocations;
- (CLRegion*)mapDictionaryToRegion:(NSDictionary*)dictionary;

@end
