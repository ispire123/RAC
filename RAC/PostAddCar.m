//
//  PostAddCar.m
//  RAC
//
//  Created by admin on 20/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "PostAddCar.h"
#import "AvaiableCars.h"
#import "TextFieldValidator.h"

#define SPAN_VALUE 1.0f
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
@interface PostAddCar ()<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    NSString *location;
}


@end

@implementation PostAddCar
@synthesize mapView;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    

    
    
    mapView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc]init];
    locationManager.delegate = self;
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }
#endif
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    // mapView.showsUserLocation = YES;
    [mapView setMapType:MKMapTypeStandard];
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
}

- (BOOL)textFieldShouldReturn: (UITextField *)textField
{
    [textField resignFirstResponder];
    [self requestForwardGeoCoding:_locationSearch.text];
    
    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _findcarButton.hidden = YES;
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self->locationManager.location.coordinate.latitude, self->locationManager.location.coordinate.longitude];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didfailwitherror: %@", error);
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentlocation = newLocation;
    [geocoder reverseGeocodeLocation:currentlocation completionHandler:^(NSArray<CLPlacemark *> * placemarks, NSError * error) {
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            location = [NSString stringWithFormat:@"%@ %@ %@ %@",
                        placemark.thoroughfare,
                        placemark.subLocality, placemark.subAdministrativeArea,placemark.name];
            [locationManager stopUpdatingLocation];
            NSLog(@"%@", location);
            
        }
    }];
    
}


- (void)requestForwardGeoCoding:(NSString *)address
{
    [geocoder geocodeAddressString:address
                 completionHandler:^(NSArray* placemarks, NSError* error) {
                     // check that there is no error
                     if (placemarks && placemarks.count > 0) {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                         placemark = [placemarks lastObject];
                         MKPlacemark *placemarkc = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         MKCoordinateRegion region;
                         region.center.latitude = topResult.location.coordinate.latitude;
                         region.center.longitude = topResult.location.coordinate.longitude;
                         region.span.latitudeDelta = SPAN_VALUE;
                         region.span.longitudeDelta = SPAN_VALUE;
                         NSArray *annotations = [mapView annotations];
                         for (id annotation in annotations) {
                             if ([annotation isKindOfClass:[MKUserLocation class]]) {
                                 continue;
                             }
                             [mapView removeAnnotation:annotation];
                         }
                         [self.mapView setRegion:region animated:YES];
                         
                         _locationSearch.text = [NSString stringWithFormat:@"%@ %@ %@",
                                                 
                                                 placemark.name, placemark.postalCode, placemark.locality];
                         location = placemark.locality;
                         
                         NSLog(@"%@",location);
                         
                     [self.mapView addAnnotation:placemarkc];
                    _findcarButton.hidden = NO;
                     }
                         
                     else{
                         
                         [error localizedDescription];
                     }
                 }];
    
    
}

 - (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 if ([segue.identifier isEqualToString:@"findCars"]) {
     AvaiableCars *AC = segue.destinationViewController;
     AC.location = location;
     
     }
 }

@end
