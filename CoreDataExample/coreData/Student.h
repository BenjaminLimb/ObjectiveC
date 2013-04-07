//
//  Student.h
//  coreData
//
//  Created by Mark McCann on 3/12/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Person.h"


@interface Student : Person

@property (nonatomic, retain) NSNumber * schoolYear;

@end
