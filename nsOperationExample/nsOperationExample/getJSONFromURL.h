//
//  getJSONFromURL.h
//  nsOperationExample
//
//  Created by r2d2 on 3/7/13.
//  Copyright (c) 2013 r2d2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface getJSONFromURL : NSOperation

@property (strong, atomic) NSURL * theURL;
@property (strong, atomic) NSDictionary *JSONDictionary;
-(id) initWithURL:(NSURL *)aURL;


@end
