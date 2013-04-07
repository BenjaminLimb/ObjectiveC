//
//  MainViewController.m
//  gui
//
//  Created by Mark McCann on 3/14/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import "MainViewController.h"
#import "ServerSetting.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"ServerSetting" inManagedObjectContext:_managedObjectContext];
	
	NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
	[automationLocation setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title = %@" , @"My Home"];
	
	[automationLocation setPredicate:predicate];
	
	NSError *aError = nil;
	NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
	
	if (locations.count == 0) {
		ServerSetting *aLocation = [NSEntityDescription insertNewObjectForEntityForName:@"ServerSetting" inManagedObjectContext:_managedObjectContext];
		
		aLocation.title = @"My Home";
		aLocation.url = @"http://sandbox.markmccann.me/objective-c/json.php";

		
		[_managedObjectContext save:&aError];
	}

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
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
