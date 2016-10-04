//
//  Item.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "Item.h"

@implementation Item


@dynamic type;
@dynamic name;

- (instancetype)initWithName:(NSString *)name andType:(NSString *)type
{
    self = [super init];
    if (self) {
        name = name;
        type = type;
    }
    return self;
}

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Item";
}



@end
