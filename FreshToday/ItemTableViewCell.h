//
//  ItemTableViewCell.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "favoriteItemProtocol.h"

@interface ItemTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *distanceLabel;

- (IBAction)favoriteItemButtonPressed:(UIButton *)sender;

//@property (weak, nonatomic) UITableView *tableView;

@property (nonatomic) id<ItemCellDelegate>delegate;

@property (assign, nonatomic) NSInteger cellIndex;

@end
