//
//  NormalLocationPermission.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-05.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "NormalLocationPermission.h"

@interface NormalLocationPermission ()

@end

@implementation NormalLocationPermission

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//if ([CLLocationManager locationServicesEnabled]){
//    
//    NSLog(@"Location Services Enabled");
//    
//    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied){
//        alert = [[UIAlertView alloc] initWithTitle:@"App Permission Denied"
//                                           message:@"To re-enable, please go to Settings and turn on Location Service for this app."
//                                          delegate:nil
//                                 cancelButtonTitle:@"OK"
//                                 otherButtonTitles:nil];
//        [alert show];
//    }
//}

@end
