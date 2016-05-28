//
//  PostNewAddCar.h
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostNewAddCar : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIDatePicker *date;
}
@property (weak, nonatomic) IBOutlet UITextField *carMake;
@property (weak, nonatomic) IBOutlet UITextField *carModel;
@property (weak, nonatomic) IBOutlet UITextField *carRego;
@property (weak, nonatomic) IBOutlet UITextField *carLocation;
@property (weak, nonatomic) IBOutlet UITextField *carYear;
@property (weak, nonatomic) IBOutlet UITextField *fromDate;
@property (weak, nonatomic) IBOutlet UITextField *toDate;
- (IBAction)addCar:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end
