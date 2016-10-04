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

- (void) viewWillAppear:(BOOL)animated {
    
    User *user = User.currentUser;
    
    if (user.currentUser == nil) {
        
        // needed to dispatch_async not once
        dispatch_async(dispatch_get_main_queue(), ^{
            // do stuff with the user
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            UIViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"Home"];
            [self.navigationController presentViewController:homeViewController animated:YES completion:nil];
            NSLog(@"current user already logged in");
        });
    }
    else {
        // show the signup or login screen.
        [User logInWithUsernameInBackground:user.username password:user.password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
            NSLog(@"couldn't login");
        }];
        
    }
}





- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
}


- (IBAction)didPressSignIn:(UIButton *)sender {
}

- (IBAction)didPressSignUp:(UIButton *)sender {
}
@end
