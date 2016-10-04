//
//  HomeViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "HomeViewController.h"
#import "User.h"
#import <Parse/Parse.h>
#import "ItemTableViewCell.h"
#import "Item.h"

@interface HomeViewController ()


@property (nonatomic) NSMutableArray * itemsForDisplay;
@property (nonatomic) Item * selectedItem;
//@property (nonatomic) Item *item;




@end

@implementation HomeViewController



- (void)getItemsFromParse {
    
    
    PFQuery *query = [Item query];
    [query whereKey:@"isAFavorite" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *items, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu places.", (unsigned long) items.count);
            for (Item *item in items) {
                NSLog(@"%@", item.objectId);
                
                //                [self.itemsForDisplay addObject:item];
            }
            
            self.itemsForDisplay = [items mutableCopy];
            [self.tableView reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    
    return _itemsForDisplay.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
    
    itemCell.delegate = self;
    
    Item *item = _itemsForDisplay[indexPath.row];
    itemCell.itemNameLabel.text = item.name;
    
    
    return itemCell;
}

-(void)addItemToFavoritesInParse {
    
    User *user = User.currentUser;

        if (!(user == nil)) {
    
            PFRelation *relation = [user relationForKey:@"favoriteItems"];
            [relation addObject:self.selectedItem];
            [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    NSLog(@" User's favorite items are %@ ", user.favoriteItems);
    
                } else {
                    NSLog(@"there is an error");
                }
            }];
        }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    self.selectedItem = self.itemsForDisplay[indexPath.row];
    

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self getItemsFromParse];
    
}











@end
