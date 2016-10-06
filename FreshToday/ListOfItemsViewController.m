//
//  ListOfItemsViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "ListOfItemsViewController.h"
#import "DetailsViewController.h"


@interface ListOfItemsViewController ()

@property (nonatomic) NSMutableArray * itemsForDisplay;
@property (nonatomic) Item * cellSelectedItem;
@property (nonatomic) Item * selectedItem;


@end

@implementation ListOfItemsViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
//    
//    return _itemsForDisplay.count;
//    
//    
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    ItemTableViewCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"itemCell"];
//    
//    
//    Item *item = _itemsForDisplay[indexPath.row];
//    itemCell.itemNameLabel.text = item.name;
//    
//    itemCell.delegate = self;
//    itemCell.cellIndex = indexPath.row;
//    
//    return itemCell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
//    
//    self.cellSelectedItem = _itemsForDisplay[indexPath.row];
//    
//    [self performSegueWithIdentifier:segueToDetailsViewController sender: self];
//    
//    //    DetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
//    //    [self presentViewController:vc animated:YES completion:nil];
//}
//
//
//
//- (IBAction)favoriteItemButtonPressed:(UIButton *)sender{
//    
//    if (self.delegate) {
//        [self.delegate didClickOnCellAtIndex:self.cellIndex withItemCell:self];
//    }
//}
//
//
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"segueToDetailsViewController"]) {
//        DetailsViewController *destinationViewController = [segue destinationViewController];
//        destinationViewController.item = self.cellSelectedItem;
//        NSLog(@"SEGUE TO DETAILS");
//    }
//}
//
////PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
////[query whereKey:@"playerName" equalTo:@"Dan Stemkoski"];
////[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
////    if (!error) {
////        // The find succeeded.
////        NSLog(@"Successfully retrieved %d scores.", objects.count);
////        // Do something with the found objects
////        for (PFObject *object in objects) {
////            NSLog(@"%@", object.objectId);
////        }
////    } else {
////        // Log details of the failure
////        NSLog(@"Error: %@ %@", error, [error userInfo]);
////    }
////}];
//
@end
