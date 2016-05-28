//
//  PostAddCar.h
//  RAC
//
//  Created by admin on 20/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "AvaiableCars.h"
#import <CoreLocation/CoreLocation.h>
@interface PostAddCar : UIViewController <CLLocationManagerDelegate,UISearchBarDelegate>
{
    UIDatePicker *date;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *locationSearch;
@property (weak, nonatomic) IBOutlet UIButton *findcarButton;




@end
