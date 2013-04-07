//
//  FlipsideViewController.m
//  gui
//
//  Created by Mark McCann on 3/14/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    [self changeView:nil];
    /*
    _visibleView = _doorsView.frame;
    _hiddenView = CGRectMake(200, _visibleView.origin.y, _visibleView.size.width, 50);*/
    
    _visibleView = CGRectMake(20, 118, 280, 322);
    _hiddenView = CGRectMake(500, 118, 280, 322); 
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

- (IBAction)changeView:(id)sender {
    
    switch ([sender selectedSegmentIndex]) {
        case 0:
            // door view
            _doorsView.frame = _visibleView;
            _lighteView.frame = _hiddenView;
            _tempView.frame = _hiddenView;
            break;
        case 1:
            // Lights view
            _doorsView.frame = _hiddenView;
            _lighteView.frame = _visibleView;
            _tempView.frame = _hiddenView;
            break;
        case 2:
            // Temp view
            _doorsView.frame = _hiddenView;
            _lighteView.frame = _hiddenView;
            _tempView.frame = _visibleView;
            break;
        default:
            break;
    }
    
    
    

    _temperatureLeftContstraint.constant += 350.0f;
    _temperatureRightConstraint.constant -= 350.0f;
    
    _doorsLeftConstraint.constant += 0.0f;
    _doorsRightConstraint.constant -= 0.0f;
    
    _lightsLeftConstraint.constant += 350.0f;
    _lightsRightConstraint.constant -= 350.0f;
    
    
    [_tempView setNeedsUpdateConstraints];
    
    [UIView animateWithDuration:.55f animations:^{
        [_tempView layoutIfNeeded];
    }];

    /*
    
    
    [UIView animateWithDuration:0.5f animations:^{
        [_doorsView layoutIfNeeded];
        [_lighteView layoutIfNeeded];
        [_tempView layoutIfNeeded];
    }];
    
    */
    
    
    
    
    
}


@end
