//
//  MainViewController.h
//  HomeAutomation
//
//  Created by Benjamin Limb on 4/2/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>
#import "ServerSettings.h"


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (ServerSettings*) getCurrentServerSettings;
@end
