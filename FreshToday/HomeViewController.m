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

@interface HomeViewController ()

//for the HOME Table View
@property (nonatomic) NSMutableArray * itemsForDisplay;
@property (nonatomic) Item * selectedItem;
@property (nonatomic) Item * cellSelectedItem;
@property (nonatomic) DetailsViewController * destinationViewController;
@property (nonatomic) UIAlertController * itemNotFound;



//for the SEARCH bar
@property (strong, nonatomic) IBOutlet UITextField *searchItemTextField;

@property (strong, nonatomic) IBOutlet UITextField *locationTextField;


- (IBAction)didPressFindButton:(UIButton *)sender;

- (void)setLocationForUser;

@end



@implementation HomeViewController

static NSString * const segueToDetailsViewController = @"segueToDetailsViewController";

#pragma Loading Stuff


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getItemsFromParse];
    [self getUserLocation];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
    [self setLocationForUser];

}




#pragma Table View Stuff

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



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    self.cellSelectedItem = _itemsForDisplay[indexPath.row];
    
    [self performSegueWithIdentifier:segueToDetailsViewController sender: self];
    
    
}


- (void)didClickOnCellAtIndex:(NSInteger)cellIndex withItemCell:(ItemTableViewCell *)itemCell {
    
    NSLog(@"Cell at Index: %ld clicked.\n Data received : %@", (long)cellIndex, itemCell.textLabel.text);
    
    
    self.selectedItem =_itemsForDisplay[cellIndex];
    NSLog(@" HEEEREEEEEEEE %@", self.selectedItem.name);
    
    [self addItemToFavoritesInParse];
}




#pragma Parse Getting and Sending Items

- (void)getItemsFromParse {
    
    
    PFQuery *query = [Item query];
    [query whereKey:@"isAFavorite" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *items, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu places.", (unsigned long) items.count);
            for (Item *item in items) {
                
                NSLog(@"%@", item.objectId);
                
            }
            
            self.itemsForDisplay = [items mutableCopy];
            [self.tableView reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


- (void)addItemToFavoritesInParse {
    
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

#pragma Location Stuff

- (void) getUserLocation {
    
    
    CLGeocoder *coder= [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:self.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = [placemarks lastObject];
        
        NSLog(@"%@", placemark);
       
        
        self.locationTextField.text = [NSString stringWithFormat:@"in %@", placemark.locality];
    }];
    
    
}


- (void)setLocationForUser {
    //CONVERTING CLLocation TO PFGeoPoint
    //"For those who choose to use CLLocationManager directly, we also provide a +geoPointWithLocation: constructor to transform CLLocations directly into PFGeoPoints - great for apps that require constant polling."
    
    User *user = User.currentUser;
    
    if (user != nil){
        //send the PFGeoPoint to Parse
        user.currentLocation = [PFGeoPoint geoPointWithLocation:self.location];
        [user addObject:user.currentLocation forKey:@"userLocation"];
        [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                
                NSLog(@"successfully sent geopoint to user in parse");
            }
            
            else {
                
                NSLog(@"something went wrong");
            }
            
        }];
        
    }
    
}


#pragma StoryBoard connects


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"segueToDetailsViewController"]) {
        self.destinationViewController = [segue destinationViewController];
        self.destinationViewController.item = self.cellSelectedItem;
        NSLog(@"SEGUE TO DETAILS");
    }
    
    
}



- (IBAction)didPressFindButton:(UIButton *)sender {
    [self queryItemFromParse];
    [self viewDidAppear:YES];
    

    
}





#pragma search for an item in location


////THE SEARCH FUNCTION


- (void) queryItemFromParse {
    NSString * searchItemName = self.searchItemTextField.text;
    
    self.itemNotFound = [UIAlertController alertControllerWithTitle:@"Item not found" message:@"Sorry none of that item or related items in your area." preferredStyle:UIAlertControllerStyleAlert];
    [self.itemNotFound addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    PFQuery *query1 = [PFQuery queryWithClassName:@"Item"];
    [query1 whereKey:@"name" equalTo:searchItemName];
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *items, NSError *error) {
        
        if (!error) {
            // The find succeeded.
            NSLog(@"I found an item with name %@.", items);
            NSString * searchItemType = [[NSString alloc] init];
            
            for (Item * item in items) {
                searchItemType = item.type;
                NSLog(@"%@", searchItemType);
            }
            
            PFQuery *query2 = [PFQuery queryWithClassName:@"Item"];
            [query2 whereKey:@"type" matchesKey:@"type" inQuery:query1];
            NSArray* moreOfTheSameType = [query2 findObjects];
            if (items.count > 0) {
                
                [self.itemsForDisplay removeAllObjects];
                [self.itemsForDisplay addObjectsFromArray:moreOfTheSameType];
                
            }
            //// IF USER TYPES IN A GENERIC TERM SUCH AS "SEAFOOD"
            if (items.count == 0) {
                
                PFQuery *query3 = [PFQuery queryWithClassName:@"Item"];
                //TYPED IN SEAFOOD INSTEAD OF SOMETHING MORE SPECIFIC
                [query3 whereKey:@"type" equalTo:searchItemName];
                NSArray* someObjectsOfThatType = [query3 findObjects];
                
                if (someObjectsOfThatType.count > 0) {
                    [self.itemsForDisplay removeAllObjects];
                    [self.itemsForDisplay addObjectsFromArray:someObjectsOfThatType];
                }
            }
        }
        
        
        
    
            else {
            
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
            
            [self presentViewController:self.itemNotFound animated:YES completion:nil];
            
            
        }
        
        [self.tableView reloadData];
        
        
    }];
    
}



@end
