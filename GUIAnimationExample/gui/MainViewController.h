//
//  MainViewController.h
//  gui
//
//  Created by Mark McCann on 3/14/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
