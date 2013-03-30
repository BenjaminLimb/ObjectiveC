//
//  ViewController.m
//  Core Data Test
//
//  Created by Andy Griffin on 3/28/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import "ViewController.h"
#import "Location.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:_managedObjectContext];
	
	NSFetchRequest *automationLocation = [[NSFetchRequest alloc] init];
	[automationLocation setEntity:entityDescription];
	
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title = %@" , @"My Home"];
	
	[automationLocation setPredicate:predicate];
	
	NSError *aError = nil;
	NSArray *locations = [_managedObjectContext executeFetchRequest:automationLocation error:&aError];
	
	if (locations == nil) {
		Location *aLocation = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:_managedObjectContext];
		
		aLocation.title = @"My Home";
		aLocation.url = @"http://sandbox.markmccann.me/objective-c/json.php";
		aLocation.info = @"Lights, Doors and Temperature for house.";
		
		[_managedObjectContext save:&aError];
	}

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
