//
//  MainViewController.m
//  HomeAutomation
//
//  Created by Benjamin Limb on 4/2/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "MainViewController.h"
#import "ServerSettings.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
            
    //@"http://sandbox.markmccann.me/objective-c/json.php";
    
}
- (ServerSettings*) getCurrentServerSettings{
    
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ServerSettings" inManagedObjectContext:_managedObjectContext];
    
    NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
    [automationLocation setEntity:entityDescription];
    
    NSError *aError = nil;
    NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
   
    return locations[0];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
       [[segue destinationViewController] setDelegate:self];
     
 
 //       NSLog(@"%@",settings.url);
         FlipsideViewController *theFlipSide = [segue destinationViewController];
    
        ServerSettings *settings = [self getCurrentServerSettings];
        
        theFlipSide.serverAddress.text = settings.url ;
    }
    
    
    
    
    
}

@end
