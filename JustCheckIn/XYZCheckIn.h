//
//  XYZCheckIn.h
//  JustCheckIn
//
//  Created by Campbell Weaver on 7/23/14.
//  Copyright (c) 2014 Campbell Weaver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZCheckIn : NSObject

@property NSString *description;
@property BOOL completed;
@property (readonly) NSDate *checkInDate;

@end
