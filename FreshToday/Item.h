//
//  Item.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Item : PFObject <PFSubclassing>

@property (nonatomic) NSString * name;
@property (nonatomic) NSString * type;
@property (nonatomic) NSString * itemDescription;
@property (nonatomic) PFGeoPoint * location;

//@property (nonatomic) BOOL isAFavorite;

//-(instancetype)initWithName: (NSString *) name aDescription:(NSString *)itemDescription aLocation:(PFGeoPoint *)location andType:(NSString *)type;

@end
