//
//  ViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"


@interface ViewController : UIViewController <SharedLocationDelegate>


@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)didPressSignIn:(UIButton *)sender;


- (IBAction)didPressSignUp:(UIButton *)sender;



@end

