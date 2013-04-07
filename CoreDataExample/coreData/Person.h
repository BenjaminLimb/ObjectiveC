//
//  Person.h
//  coreData
//
//  Created by Mark McCann on 3/12/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Scripture;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * married;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *scriptures;
@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addScripturesObject:(Scripture *)value;
- (void)removeScripturesObject:(Scripture *)value;
- (void)addScriptures:(NSSet *)values;
- (void)removeScriptures:(NSSet *)values;

@end
