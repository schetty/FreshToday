//
//  ViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "ViewController.h"
#import "User.h"


@interface ViewController ()



@end

@implementation ViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    User *user = [User currentUser];
//    user.username = self.usernameTextField.text;
//    user.password = self.passwordTextField.text;
    
    if (!(user == nil)) {
        
        // needed to dispatch_async not once
//        dispatch_async(dispatch_get_main_queue(), ^{
            // do stuff with the user
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            UIViewController *homeViewController = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"Home"];
//            [self presentViewController:homeViewController animated:YES completion:nil];
//            NSLog(@"current user already logged in");
//        });
    }
    
    else {
        
        
        // show the signup or login screen.
        [User logInWithUsernameInBackground:@"joe" password:@"smith" block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            NSLog(@"couldn't login %@", error);
        }];
        
    }
}





- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}


- (IBAction)didPressSignIn:(UIButton *)sender {
    
    if ([User currentUser]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            // do stuff with the user
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UIViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"Home"];
            [self.navigationController presentViewController:homeViewController animated:YES completion:nil];
            NSLog(@"current user already logged in");
        });
    }
    
    else {
        NSLog(@"could not login");
    }
}

- (IBAction)didPressSignUp:(UIButton *)sender {
}


@end
