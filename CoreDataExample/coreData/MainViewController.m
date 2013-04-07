//
//  MainViewController.m
//  coreData
//
//  Created by Mark McCann on 3/12/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import "MainViewController.h"
#import "Student.h"
#import "Scripture.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CoreData/Articles/cdCreateMOs.html
    Student *aStudent = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Student"
                        inManagedObjectContext:_managedObjectContext];
    
    aStudent.name = @"Thomas Edison";
    aStudent.schoolYear = [NSNumber numberWithInt:1];
    aStudent.age = [NSNumber numberWithInt:45];
    
    // Save in sqlite
    NSError *aError = nil;
    [_managedObjectContext save:&aError];
    
    
    // NSManagedObjectContext *moc = [self managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:@"Student"
                                              inManagedObjectContext:_managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    // Set example predicate and sort orderings...
    NSNumber *minimumAge = [NSNumber numberWithInt:299];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > %@", minimumAge];
    [request setPredicate:predicate];
    
    NSError *error;
    NSArray *students = [_managedObjectContext executeFetchRequest:request error:&error];
    if (students == nil)
    {
        // Deal with error...
    }
    
    for (Student *fetchedStudent in students)
    {
         NSLog(@"Name: %@, Age: %@, School Year: %@",
               fetchedStudent.name,fetchedStudent.age,fetchedStudent.schoolYear);
    }
    
    //[_managedObjectContext deleteObject:aStudent];
    //[_managedObjectContext save:&aError];
    
    Scripture *aScripture = [NSEntityDescription
                             insertNewObjectForEntityForName:@"Scripture"
                             inManagedObjectContext:_managedObjectContext];
    
    aScripture.reference = @"Moses 1:29";
    aScripture.text = @"For Behold ...";
    
    [aStudent addScripturesObject:aScripture];
    
    [_managedObjectContext save:&aError];
    
    for (Scripture *fetchedScripture in [aStudent scriptures]) {
        NSLog(@"%@",fetchedScripture);
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
