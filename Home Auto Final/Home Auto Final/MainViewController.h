//
//  MainViewController.h
//  Home Auto Final
//
//  Created by Andy Griffin on 3/28/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
