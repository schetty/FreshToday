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
@property (nonatomic) NSString * addressStr;
@property (nonatomic) NSString * descStr;



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
        self.item.name = self.itemTitleTextField.text;
        self.item.itemDescription = self.itemDescriptionTextField.text;
        self.item.type = self.itemTypeTextField.text;
        self.addressStr = self.itemLocaationTextField.text;
        [self.item saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"YAAAAAAY");
                [self addLocationToItem];

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
            self.item[@"location"] = [PFGeoPoint geoPointWithLocation:location];
            [self.item save];
        }
    }];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HomeViewController *homeVC = [segue destinationViewController];
    homeVC.location = self.location;
//    homeVC.addressStr = self.addressStr;
//    homeVC.descStr = self.descStr;
}


@end
