//
//  DetailsViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *businessNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *itemDescLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (nonatomic) CLLocationManager* locationManager;

@property BOOL isSetUp;




@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _locationManager = [CLLocationManager new];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    self.isSetUp = NO;
    
    //    self.locationManager = [LocationManager sharedManager];
    _locationManager.delegate = self;
    //    [self.locationManager startLocationMonitoring];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    
    /// LABELS
    self.itemNameLabel.text = self.item.name;
    self.itemDescLabel.text = self.item.itemDescription;
    self.businessNameLabel.text = self.item.type;
    
}




- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"stuff");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    

}


-(void)locationManager:(CLLocationManager *)locManager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    NSLog(@"%@ THESE ARE LOCATIONS", locations);
    
    [self.locationManager stopUpdatingLocation];
    
    
    //store location into a variable
    
    CLLocation *aLocation = [locations lastObject];
    
    
    //zoom
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    
    
    //zoom into coordinates
    MKCoordinateRegion region = MKCoordinateRegionMake(aLocation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    //create a geocoder --- converts geocode to a human readable address
    CLGeocoder *coder= [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:aLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
    }];
    
}


@end
