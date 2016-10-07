//
//  DetailsViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController () <MKMapViewDelegate, MKAnnotation>{
    
    NSString *title;
    NSString *subtitle;
    CLLocationCoordinate2D coordinate;
}

@property (strong, nonatomic) IBOutlet UILabel *itemNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *businessNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *itemDescLabel;

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@property (nonatomic) CLLocationManager* locationManager;

@property (nonatomic, assign)CLLocationCoordinate2D coordinate;


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
    self.addressLabel.text = @"";
    [self getLocationOfItem];
    
}




- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"stuff");
}



- (void) getLocationOfItem {
    

    PFGeoPoint *point = self.item[@"location"];
    

    CLLocation *place = [[CLLocation alloc] initWithLatitude:point.latitude longitude:point.longitude];

    self.coordinate = CLLocationCoordinate2DMake(place.coordinate.latitude, place.coordinate.longitude);
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = self.coordinate;
    [self.mapView addAnnotation:annotation];
    [self.mapView setCenterCoordinate:self.coordinate animated:YES];
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    MKCoordinateRegion region = MKCoordinateRegionMake(place.coordinate, span);
    [self.mapView setRegion:region animated:YES];


}

-(void)locationManager:(CLLocationManager *)locManager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    NSLog(@"%@ THESE ARE LOCATIONS", locations);
    
    [self.locationManager stopUpdatingLocation];
    
    return;
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
