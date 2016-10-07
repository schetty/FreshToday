//
//  BusinessViewController.m
//  FreshToday
//
//  Created by naomi schettini on 2016-10-06.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "BusinessViewController.h"
#import "HomeViewController.h"
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Item.h"
@import CoreLocation;

@interface BusinessViewController ()


@property (nonatomic) Item * item;

- (IBAction)didPressUpload:(UIButton *)sender;

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)didPressAdd:(UIButton *)sender {
    User *user = [User currentUser];


    if(user != nil) {
        
        self.item = [Item objectWithClassName:@"Item"];
        self.item[@"name"] = self.itemTitleTextField.text;
        self.item[@"description"] = self.itemDescriptionTextField.text;
        self.item[@"type"] = self.itemTypeTextField.text;
        [self addLocationToItem];
        [self.item saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"YAAAAAAY");
          
            } else {
                NSLog(@"UH OH!!");
            }
            
            
        }];
        
        
//        [self performSegueWithIdentifier:@"showHome" sender:sender];
    }
    
    else {
        NSLog(@"WTF");
    }
}



- (void) addLocationToItem {
    NSString *address = self.itemLocaationTextField.text;
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks firstObject];
            CLLocation *location = placemark.location;
            NSLog(@"Location %@ stored", placemark);
            self.item[@"location"] = [PFGeoPoint geoPointWithLocation:placemark.location];
            
        }
    }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HomeViewController *homeVC = [segue destinationViewController];
    homeVC.location = self.location;
}


@end
