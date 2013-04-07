//
//  ServerSetting.h
//  gui
//
//  Created by Benjamin Limb on 4/2/13.
//  Copyright (c) 2013 Mark McCann. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ServerSetting : NSManagedObject

@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * title;

@end
