//
//  BlurredLocationPermission.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-05.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "BlurredLocationPermission.h"
#import "HomeViewController.h"
#import "BusinessViewController.h"

@interface BlurredLocationPermission () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *location;



@end

@implementation BlurredLocationPermission


static const NSString * storyboardName = @"MainStoryboard";

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [_locationManager requestWhenInUseAuthorization];

    });
    
    [_locationManager startUpdatingLocation];
    
    NSLog(@"Location Services Enabled");
    
    
    if (([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) || ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined) || [CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted){
    
        NSLog(@"denies");

        
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)segue:(CLLocation *)location{
    
    if (self.isABusiness == NO) {
        [self performSegueWithIdentifier:@"showHomeVC" sender:location];

    }
    if (self.isABusiness == YES) {
        [self performSegueWithIdentifier:@"segueToBusinessView" sender:location];
        
        
    }
    
    else {
        NSLog(@"SUMTHIN WRONG!!!");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [_locationManager stopUpdatingLocation];
    
    if (!self.location){
        
        self.location = locations.firstObject;
        [self segue:self.location];

    }
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.isABusiness == NO && [segue.identifier isEqualToString:@"showHomeVC"]) {
        HomeViewController *destinationViewController = [segue destinationViewController];
        CLLocation *location = (CLLocation *) sender;
        
        destinationViewController.location = location;
        
        NSLog(@"Inside segue to HomeViewController");
        
    }
    
    if (self.isABusiness == YES && [segue.identifier isEqualToString:@"segueToBusinessView"]) {
        BusinessViewController *destinationViewController = [segue destinationViewController];
        CLLocation *location = (CLLocation *) sender;
        
        destinationViewController.location = location;
        
        NSLog(@"Inside segue to BusinessViewController");
        
    }
    
}





@end
