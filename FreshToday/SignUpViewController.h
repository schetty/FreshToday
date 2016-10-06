//
//  SignUpViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SignUpViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;

- (IBAction)isABusiness:(UISwitch *)sender;

- (IBAction)didPressSignUp:(UIButton *)sender;

@end
