//
//  ViewController.h
//  Threading
//
//  Created by Andy Griffin on 2/21/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)startThread:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *theText;
@end
