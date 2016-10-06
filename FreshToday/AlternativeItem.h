//
//  AlternativeItem.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-05.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Parse/Parse.h>

@interface AlternativeItem : PFObject<PFSubclassing>

@property (nonatomic) NSString * name;
@property (nonatomic) NSString * type;

@end
