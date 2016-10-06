//
//  AlternativeItem.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-05.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "AlternativeItem.h"

@implementation AlternativeItem


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
    return @"AlternativeItem";
}

@end
