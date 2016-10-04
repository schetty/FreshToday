//
//  favoriteItemProtocol.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-04.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "Item.h"

@protocol FavoriteItemDelegate <NSObject>

-(void)addItemToFavoritesInParse;

//Button is pressed in a specific cell then tells the View Controller to update the user's array of favorite items

@optional
- (void)didSelectAFavoriteItem:(Item*)item;
- (IBAction)favoriteItemButtonPressed:(UIButton *)sender;



@end
