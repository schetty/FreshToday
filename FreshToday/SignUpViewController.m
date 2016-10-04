//
//  SignUpViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "SignUpViewController.h"
#import "User.h"


@interface SignUpViewController ()
-(void) signUp;
@end

@implementation SignUpViewController

-(void) signUp {
    User *user = [User user];
    user.username = self.nameTextField.text;
    user.password = self.passwordTextField.text;
    user.email = self.emailTextField.text;

    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (!error) {
            
            
            User *user = [[User alloc] init];
            
            [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
                if (succeeded) NSLog(@"YAY!!");
            }];
        }
        
        
        else {
            
            //            NSString *errorString = [error userInfo][@"error"];
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"There was an error." preferredStyle:UIAlertControllerStyleAlert];
            
            [errorAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
                [self presentViewController:errorAlert animated:YES completion:nil];
                
            }]];
            
        }
        
    }];
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
