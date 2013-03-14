//
//  SMViewController.h
//  ScriptureMastery
//
//  Created by Benjamin Limb on 3/4/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scriptureText;
@property (weak, nonatomic) IBOutlet UILabel *referenceText;
@property (weak, nonatomic) NSString *scriptureSource;
@property (weak, nonatomic) NSString *scriptureLetters;
@property (assign) BOOL toggleSate;


- (IBAction)toggleVisible:(id)sender;

@end
