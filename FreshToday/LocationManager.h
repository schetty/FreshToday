//
//  LocationManager.h
//  FreshToday
//
//  Created by naomi schettini on 2016-10-03.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@protocol SharedLocationDelegate <NSObject>

-(void) passCurrentLocation:(CLLocation*) currentLocation;

@end



@interface LocationManager  : NSObject <CLLocationManagerDelegate>

@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic, weak) id<SharedLocationDelegate> delegate;
@property CLGeocoder *geocoder;
@property CLPlacemark *placemark;


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;

- (void) startLocationMonitoring;

+ (id)sharedManager;

@end

