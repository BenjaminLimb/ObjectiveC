//  ViewController.m
//  Animation Demo
//
//  Created by Andy Griffin on 4/8/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

#define PI 3.141592654

- (void)viewDidLoad
{
    [super viewDidLoad];

	_rotated = NO;
	_scaled = NO;
	_translated = NO;

	_demoView.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTL:(id)sender {
	[UIView animateWithDuration:.6 animations:^{
		_demoView.alpha = (_demoView.alpha == 1.0) ? 0.0 : 1.0;
	}];
}
- (IBAction)buttonTM:(id)sender {
	[UIView animateWithDuration:.6 animations:^{
		_demoView.backgroundColor = (_demoView.backgroundColor == [UIColor blackColor]) ? [UIColor whiteColor] : [UIColor blackColor];
	}];
}


- (IBAction)buttonBL:(id)sender {
	if (_rotated) {
		[UIView animateWithDuration:.6 animations:^{
			_demoView.transform = CGAffineTransformMakeRotation(0);
		}];
		_rotated = NO;
	}else{
		[UIView animateWithDuration:.6 animations:^{
			_demoView.transform = CGAffineTransformMakeRotation(PI);
		}];
		_rotated = YES;
	}
}
- (IBAction)buttonBM:(id)sender {
	
		if (_translated) {
			[UIView animateWithDuration:.6 animations:^{
				_demoView.transform = CGAffineTransformMakeTranslation(0, 0);
			}];
			_translated = NO;
		}else{
			[UIView animateWithDuration:.6 animations:^{
				_demoView.transform = CGAffineTransformMakeTranslation(-200, 0);
			}];
			_translated = YES;
		}
}
- (IBAction)buttonBR:(id)sender {
		if (_scaled) {
			[UIView animateWithDuration:.6 animations:^{
				_demoView.transform = CGAffineTransformMakeScale(1, 1);
			}];
			_scaled = NO;
		}else{
			[UIView animateWithDuration:.6 animations:^{
				_demoView.transform = CGAffineTransformMakeScale(.1, .1);
			}];
			_scaled = YES;
		}
}
@end
