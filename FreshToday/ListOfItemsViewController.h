//
//  ListOfItemsViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "ItemTableViewCell.h"
#import "favoriteItemProtocol.h"

@interface ListOfItemsViewController : UIViewController <UITableViewDelegate, ItemCellDelegate>


@property (nonatomic) Item * item;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet UILabel *foodItemName;

- (IBAction)favoriteItemButtonPressed:(UIButton *)sender;

- (void)didClickOnCellAtIndex:(NSInteger)cellIndex withItemCell:(ItemTableViewCell *)itemCell;



@end
