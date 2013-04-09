//
//  MainViewController.m
//  HomeAutomation
//
//  Created by Benjamin Limb on 4/2/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "MainViewController.h"
#import "ServerSettings.h"
#import "CurrentStatusGetter.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize queue;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize a queue for future threading
    queue = [[NSOperationQueue alloc]init];
    
    [self initServerURL];
    [self getCurrentStatus];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // controller.serverAddress
    
    // code to save settings
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
	
	NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
	[automationLocation setEntity:entityDescription];
	
	NSError *aError = nil;
	NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
	
    ServerSettings *aLocation = nil;
    
    if(locations.count == 0){
        aLocation = [NSEntityDescription insertNewObjectForEntityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
    }
    else{
        aLocation = locations[0];
    }
    
    aLocation.title = @"My Home";
    aLocation.url= controller.serverAddress.text;
    
    [_managedObjectContext save:&aError];
    
}

    //@"http://sandbox.markmccann.me/objective-c/json.php";

- (IBAction)lightsButton:(id)sender {
    
    NSLog(@"lights button pressed");
    
    // toggle the current light setting
    if (_lightsOn){
        _lightsOn = NO;
    }else if (!_lightsOn){
        _lightsOn = YES;
    }
    
    // send the desired update to the server
    [self updateCurrentStatus];

}


- (IBAction)doorsButton:(id)sender {
    NSLog(@"doors button pressed");
    
    // toggle the current door setting
    if (_doorsLocked){
        _doorsLocked = NO;
    }else if (!_doorsLocked){
        _doorsLocked = YES;
    }
    
    // send the desired update to the server
    [self updateCurrentStatus];
}

// gets the current server settings that are saved in CORE DATA
- (ServerSettings*) getCurrentServerSettings{
    
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
    
    NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
    [automationLocation setEntity:entityDescription];
    
    NSError *aError = nil;
    NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
   
    if (locations.count == 0){
        return nil;
    }
    return locations[0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
       [[segue destinationViewController] setDelegate:self];
    }
}



// only called by a nsoperation at the end of its main function
-(void) updateViewElements:(NSDictionary *)theDictionary{
    
    // update lights status on the view
    if ([[theDictionary objectForKey:@"lights"] isEqual: @"on"]){
        _lightsIcon.image = [UIImage imageNamed:@"lights_on.png"];
        _lightsOn = YES;
    }else if([[theDictionary objectForKey:@"lights"] isEqual: @"off"]){
        _lightsIcon.image = [UIImage imageNamed:@"lights_off.png"];
        _lightsOn = NO;
    }
    
    // update lock status on the view
    if ([[theDictionary objectForKey:@"doors"] isEqual: @"locked"]){
        _doorsIcon.image = [UIImage imageNamed:@"locked.png"];
        _doorsLocked = YES;
    }else if([[theDictionary objectForKey:@"doors"] isEqual: @"unlocked"]){
        _doorsIcon.image = [UIImage imageNamed:@"unlocked.png"];
        _doorsLocked = NO;
    }
    
    NSLog(@"update view complete");
    
}

// checks to find the current status 
-(void)getCurrentStatus{
    
    // fetches the current URL from coredate "serverSettings"
    CurrentStatusGetter *currStatus = [[CurrentStatusGetter alloc] initWithURL:[NSURL URLWithString:[self getCurrentServerSettings].url] andView:self];
    
    NSLog(@"THE URL IS: %@",currStatus.theURL);
    
    // add the operation to the queue
    [self.queue addOperation:currStatus];
}


// attempts to update the current status of lights and doors to the server
-(void)updateCurrentStatus{
    
    NSLog(@"beginning of updateCurrentStatus");
    
    // this NSOperation object will send an update to the server
    ChangeStatus *theStatusChanger = [[ChangeStatus alloc] initWithURL:[NSURL URLWithString:[self getCurrentServerSettings].url] andView:self];
    
    // set the lights action
    if (_lightsOn){
        theStatusChanger.lights = @"on";
    }else {
        theStatusChanger.lights = @"off";
    }
    
    // set the doors action
    if (_doorsLocked){
        theStatusChanger.doors = @"lock";
    }else{
        theStatusChanger.doors = @"unlock";
    }
    
    [self getCurrentStatus];
    
    NSLog(@"before adding theStatusChanger to the queue");
    
   [self.queue addOperation:theStatusChanger];
    
}


// this makes sure that there is an initial value for the server address
-(void)initServerURL{
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
	
	NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
	[automationLocation setEntity:entityDescription];
	
	NSError *aError = nil;
	NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
	
    ServerSettings *aLocation = nil;
    
    if(locations.count == 0){
        aLocation = [NSEntityDescription insertNewObjectForEntityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
    }
    else{
        aLocation = locations[0];
    }
    
    aLocation.title = @"My Home";
    aLocation.url= @"http://192.168.10.199/home_auto/";
 
    //@"http://sandbox.markmccann.me/objective-c/json.php"
    
    [_managedObjectContext save:&aError];
}

@end
