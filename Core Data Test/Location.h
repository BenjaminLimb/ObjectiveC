//
//  Location.h
//  Core Data Test
//
//  Created by Andy Griffin on 3/28/13.
//  Copyright (c) 2013 Andy Griffin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * info;

@end
