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


- (IBAction)favoriteItemButtonPressed:(UIButton *)sender;

@property (weak, nonatomic) UITableView *tableView;

@property (nonatomic) id<FavoriteItemDelegate>delegate;


@end
