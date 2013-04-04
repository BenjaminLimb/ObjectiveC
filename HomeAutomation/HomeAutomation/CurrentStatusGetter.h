//
//  CurrentStatusGetter.h
//  HomeAutomation
//
//  Created by r2d2 on 4/3/13.
//  Copyright (c) 2013 Benjamin Limb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"

@interface CurrentStatusGetter : NSOperation

@property (strong, atomic) NSURL * theURL;
@property (strong, atomic) NSDictionary *JSONDictionary;
@property (strong) UIViewController *theView;
@property (nonatomic, strong) NSOperationQueue *queue;


-(id) initWithURL:(NSURL *)aURL;

-(id) initWithURL:(NSURL *)aURL andView:(UIViewController *)aView;

-(void)setViewController:(UIViewController *)theView;

@end
