//
//  User.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "User.h"

@implementation User


@dynamic favoriteItems;
@dynamic currentLocation;
@dynamic isABusiness;
@dynamic email;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)load {
    [self registerSubclass];
}


@end
