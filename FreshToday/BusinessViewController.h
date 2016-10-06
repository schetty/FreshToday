//
//  BusinessViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-06.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface BusinessViewController : ViewController

@property (strong, nonatomic) IBOutlet UITextField *itemTitleTextField;

@property (strong, nonatomic) IBOutlet UITextView *itemDescriptionTextField;

- (IBAction)didPressAdd:(UIButton *)sender;

@end
