//
//  SignUpViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"
#import "BlurredLocationPermission.h"
#import <Bolts/Bolts.h>


@interface SignUpViewController ()
-(void) signUp;

@property (nonatomic) User *user;
@property (nonatomic) BlurredLocationPermission * blurredLocationPermissionView;

@end

@implementation SignUpViewController

-(void) signUp {
    
   self.user = [User user];
    
    self.user.username = self.nameTextField.text;
    self.user.password = self.passwordTextField.text;
    self.user.email = self.emailTextField.text;


        
        [self.user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
            
                NSLog(@"Succeeded LOGGIN IN %@", self.user);
                
            } else {
                NSLog(@"this is the error: %@", error);
                [self errorAlert];
            
            }
        }];
    
}

- (void) errorAlert {
    
UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There was an error." preferredStyle:UIAlertControllerStyleAlert];

[errorAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    
    [self presentViewController:errorAlert animated:YES completion:nil];
    
}]];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueToGetPermission"]) {
        
        self.blurredLocationPermissionView = [segue destinationViewController];

        
        if (self.switchValue.on) {
            
            self.blurredLocationPermissionView.isABusiness = YES;
            
            NSLog(@"PASSING SEGUE THAT THIS USER IS INDEED, A BUSINESS");
            
        }
        else {
            
            self.blurredLocationPermissionView.isABusiness = NO;
            
            NSLog(@"a customer");
        }
        
    }
    
    else {
        [self errorAlert];
        NSLog(@"something went wrong");
    }
}



- (IBAction)didPressSignUp:(UIButton *)sender {
    [self signUp];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
