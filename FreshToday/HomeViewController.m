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
#import "DetailsViewController.h"
#import "ListOfItemsViewController.h"

@interface HomeViewController ()

//for the HOME Table View
@property (nonatomic) NSMutableArray * itemsForDisplay;
@property (nonatomic) Item * selectedItem;
@property (nonatomic) Item * cellSelectedItem;


//for the SEARCH bar
@property (strong, nonatomic) IBOutlet UITextField *searchItemTextField;

@property (strong, nonatomic) IBOutlet UITextField *locationTextField;


- (IBAction)didPressFindButton:(UIButton *)sender;

@end



@implementation HomeViewController

static NSString * const segueToDetailsViewController = @"segueToDetailsViewController";


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
    

    Item *item = _itemsForDisplay[indexPath.row];
    itemCell.itemNameLabel.text = item.name;
    
    itemCell.delegate = self;
    itemCell.cellIndex = indexPath.row;
    
    return itemCell;
}

-(void)addItemToFavoritesInParse {
    
    User *user = User.currentUser;

        if (user != nil) {
    
            PFRelation *relation = [user relationForKey:@"favoriteItems"];
            if (self.selectedItem) {
                [relation addObject:self.selectedItem];
                [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        NSLog(@" User's favorite items are %@ ", user.favoriteItems);
                        
                    } else {
                        NSLog(@"there is an error");
                    }
                }];

            }
            else {
                NSLog(@"no selected Item");
            }
        }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    self.cellSelectedItem = _itemsForDisplay[indexPath.row];
  
    [self performSegueWithIdentifier:segueToDetailsViewController sender: self];

//    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
//    [self presentViewController:vc animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToDetailsViewController"]) {
        DetailsViewController *destinationViewController = [segue destinationViewController];
        destinationViewController.item = self.cellSelectedItem;
        NSLog(@"SEGUE TO DETAILS");
    }
    
    if ([segue.identifier isEqualToString:@"segueToListViewController"]) {
        ListOfItemsViewController *listViewController = [segue destinationViewController];

        NSLog(@"SEARCH REQUESTED");
    }

}

- (void)didClickOnCellAtIndex:(NSInteger)cellIndex withItemCell:(ItemTableViewCell *)itemCell {
    
    NSLog(@"Cell at Index: %ld clicked.\n Data received : %@", (long)cellIndex, itemCell.textLabel.text);
    
 
    self.selectedItem =_itemsForDisplay[cellIndex];
    NSLog(@" HEEEREEEEEEEE %@", self.selectedItem.name);
    
    [self addItemToFavoritesInParse];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self getItemsFromParse];
    
}


#pragma search for an item in location
////THE SEARCH FUNCTION

- (IBAction)didPressFindButton:(UIButton *)sender {
    
    
    
    
}



@end
