//
//  ViewController.h
//  Animation Demo
//
//  Created by Andy Griffin on 4/8/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *demoView;

@property BOOL rotated;
@property BOOL scaled;
@property BOOL translated;

- (IBAction)buttonTL:(id)sender;
- (IBAction)buttonBL:(id)sender;
- (IBAction)buttonTM:(id)sender;
- (IBAction)buttonBM:(id)sender;
- (IBAction)buttonBR:(id)sender;

@end
