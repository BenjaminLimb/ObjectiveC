//
//  FlipsideViewController.m
//  HomeAutomation
//
//  Created by Benjamin Limb on 4/2/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import "FlipsideViewController.h"
#import "MainViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController
@synthesize serverAddress;
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    MainViewController *caller = [self delegate];
    ServerSettings *theSettings = [caller getCurrentServerSettings];
    serverAddress.text = theSettings.url;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
