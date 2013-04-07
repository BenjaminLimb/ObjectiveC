//
//  Scripture.h
//  coreData
//
//  Created by Mark McCann on 3/12/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Scripture : NSManagedObject

@property (nonatomic, retain) NSString * reference;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSSet *people;
@end

@interface Scripture (CoreDataGeneratedAccessors)

- (void)addPeopleObject:(NSManagedObject *)value;
- (void)removePeopleObject:(NSManagedObject *)value;
- (void)addPeople:(NSSet *)values;
- (void)removePeople:(NSSet *)values;

@end
