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
#import "CurrentStatusGetter.h"
#import "ChangeStatus.h"


@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) ServerSettings *currentServerSettings;
- (ServerSettings*) getCurrentServerSettings;

@property (weak, nonatomic) IBOutlet UIImageView *lightsIcon;
@property (weak, nonatomic) IBOutlet UIImageView *doorsIcon;
@property (weak, nonatomic) IBOutlet UILabel *tempDisplay;

@property (nonatomic, strong) NSOperationQueue *queue;

@property BOOL lightsOn;
@property BOOL doorsLocked;
@property int temp;

- (IBAction)lightsButton:(id)sender;
- (IBAction)doorsButton:(id)sender;



-(void)getCurrentStatus;
-(void)updateCurrentStatus;

-(void) updateViewElements:(NSDictionary *)theDictionary;

-(void)initServerURL;

@end
