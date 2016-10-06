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
@property (nonatomic) PFGeoPoint * location;
//@property User *currentUser;

//-(void)signUp;
//-(void) setLocation:(PFGeoPoint *)location;

//-(instancetype)initWithUsername:(NSString *)username password:(NSString *)password email:(NSString *)email location:(PFGeoPoint *)location;


@end
