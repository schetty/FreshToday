//
//  BlurredLocationPermission.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-05.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "BlurredLocationPermission.h"
#import "HomeViewController.h"

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
    
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    
    NSLog(@"Location Services Enabled");
    
    
    if (([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) || ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined) || [CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted){
        //
        //                do {
        //                    [_locationManager requestWhenInUseAuthorization];
        //
        //                } while ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied);
        //
        UIAlertController * deniedAlert = [UIAlertController alertControllerWithTitle:@"App Permission Denied" message:@"Please enable location services so we can find you food suppliers near you" preferredStyle:UIAlertControllerStyleAlert];
        [deniedAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self presentViewController:deniedAlert animated:NO completion:nil];
        }]];
        
        
        
        
        
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)segue:(CLLocation *)location{
    
    [self performSegueWithIdentifier:@"showHomeVC" sender:location];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    [_locationManager stopUpdatingLocation];
    
    if (!self.location){
        
        self.location = locations.firstObject;
        [self segue:self.location];

    }
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showHomeVC"]) {
        HomeViewController *destinationViewController = [segue destinationViewController];
        CLLocation *location = (CLLocation *) sender;
        
        destinationViewController.location = location;
        
        NSLog(@"Inside segue to HomeViewController");
        
    }
    
}




@end
