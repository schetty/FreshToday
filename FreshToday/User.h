//
//  User.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Item.h"


@interface User : PFUser <PFSubclassing>

+ (NSString *)User;

@property (nonatomic) PFRelation <Item *>* favoriteItems;
@property (nonatomic) PFGeoPoint * currentLocation;
@property BOOL isABusiness;



@end
