//
//  HomeViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "favoriteItemProtocol.h"

@interface HomeViewController : UIViewController <UITableViewDelegate, FavoriteItemDelegate>

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;

@property (strong, nonatomic) IBOutlet UITextField *locationTextField;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


//View controller has a delegate... let it know if the user has clicked the heart so it can add it to the user's favorite items array ///// PASS THE ITEM ITSELF



@end
