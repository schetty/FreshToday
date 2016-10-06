//
//  DetailsViewController.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationManager.h"
#import "Item.h"
@import MapKit;
@import CoreLocation;

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic) Item* item;

@end
