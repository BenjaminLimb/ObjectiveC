//
//  ViewController.h
//  JSONtest
//
//  Created by r2d2 on 2/14/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)send:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *doorDisplay;
@property (weak, nonatomic) IBOutlet UILabel *garageDisplay;
@property (weak, nonatomic) IBOutlet UILabel *lightsDisplay;
@property (weak, nonatomic) IBOutlet UILabel *thermoDisplay;
- (IBAction)post:(id)sender;

@end
