//
//  ViewController.m
//  Threading
//
//  Created by Andy Griffin on 2/21/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callbackMethod{
    NSLog(@"Callback called.");
}

- (IBAction)startThread:(id)sender {
//	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
//        for(int i = 0; i < 1000; i++){
//            NSLog(@"Hilo:%d",i);
//            
//            dispatch_async(dispatch_get_main_queue(), ^{
//                _theText.backgroundColor = [UIColor blueColor];
//            });
//            sleep(.1);  // simulating a thread being tied up for .1 seconds
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self callbackMethod];  // method called after above thread has completed running
//        });
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        for(int i = 0; i < 1000; i++){
//            NSLog(@"Filo:%d",i);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                _theText.backgroundColor = [UIColor redColor];
//            });
//            sleep(.11);  // simulating a thread being tied up for .11 seconds
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self callbackMethod];  // method called after above thread has completed running
//        });
//    });
    
    // what is the "main queue"?
	__block int i = 1;
	dispatch_queue_t theQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0); 
	while (YES) {
		NSLog(@"%d", i);
		i++;		
		dispatch_async(theQueue, ^{
			
			sleep(60*60);
			
		});
	}
}
@end
