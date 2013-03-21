//
//  ViewController.h
//  nsOperationExample
//
//  Created by r2d2 on 2/26/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *theURLDisplay;
@property (nonatomic, strong) NSOperationQueue *queue;


- (IBAction)getJSON:(id)sender;

@end
