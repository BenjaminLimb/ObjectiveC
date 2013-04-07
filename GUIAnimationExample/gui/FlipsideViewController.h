//
//  FlipsideViewController.h
//  gui
//
//  Created by Mark McCann on 3/14/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *doorsView;

@property (weak, nonatomic) IBOutlet UIView *lighteView;

@property (weak, nonatomic) IBOutlet UIView *tempView;

@property CGRect visibleView;

@property CGRect hiddenView;

- (IBAction)done:(id)sender;

- (IBAction)changeView:(id)sender;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *temperatureLeftContstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *temperatureRightConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lightsLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lightsRightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *doorsLeftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *doorsRightConstraint;



@end
