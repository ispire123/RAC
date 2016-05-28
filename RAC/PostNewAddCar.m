//
//  PostNewAddCar.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "PostNewAddCar.h"
#import <Parse/Parse.h>
#import "TextFieldValidator.h"
@interface PostNewAddCar () <UITextFieldDelegate>
{
    NSString *fromDt;
    NSString *toDt;
}

@end

@implementation PostNewAddCar
@synthesize scrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    date = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    date.datePickerMode = UIDatePickerModeDate;
    date.minimumDate = [NSDate date];
    date.maximumDate = [NSDate dateWithTimeIntervalSinceNow:2592000];
    [self.fromDate setInputView : date];
    UIToolbar *toolBarDate = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBarDate.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *doneButtonDate = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(showSelectedDate)];
    UIBarButtonItem *cancelButtonDate = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched:)];
    [toolBarDate setItems:[NSArray arrayWithObjects:cancelButtonDate, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButtonDate, nil]];
    [self.fromDate setInputAccessoryView:toolBarDate];
    
    
    date = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    date.datePickerMode = UIDatePickerModeDate;
    date.minimumDate = [NSDate date];
    date.maximumDate = [NSDate dateWithTimeIntervalSinceNow:2592000];
    [self.toDate setInputView : date];
    UIToolbar *toolBarDate1 = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    toolBarDate.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *doneButtonDate1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(showSelectedDate1)];
    UIBarButtonItem *cancelButtonDate1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelTouched1:)];
    [toolBarDate1 setItems:[NSArray arrayWithObjects:cancelButtonDate1, [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], doneButtonDate1, nil]];
    [self.toDate setInputAccessoryView:toolBarDate1];

    
}


-(void)showSelectedDate{
    NSDateFormatter *serviceDateFormatter = [[NSDateFormatter alloc] init];
    [serviceDateFormatter setDateFormat:@"dd / MM / YYYY"];
    fromDt = [serviceDateFormatter stringFromDate:date.date];
    self.fromDate.text = fromDt;
    [_fromDate resignFirstResponder];
}



-(void)showSelectedDate1{
    NSDateFormatter *serviceDateFormatter = [[NSDateFormatter alloc] init];
    [serviceDateFormatter setDateFormat:@"dd / MM / YYYY"];
    toDt = [serviceDateFormatter stringFromDate:date.date];
    self.toDate.text = toDt;
    [_toDate resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)cancelTouched:(UIBarButtonItem *)sender{
    // hide the picker view
    [self.fromDate resignFirstResponder];
}
#pragma mark - doneTouched
- (void)cancelTouched1:(UIBarButtonItem *)sender{
    // hide the picker view
    [self.toDate resignFirstResponder];
    // perform some action
}

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    CGPoint scrollpoit = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollpoit animated:YES];
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    [scrollView setContentOffset:CGPointZero animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addCar:(id)sender {
    if ([_carMake.text isEqualToString:@""] ||
        [_carModel.text isEqualToString:@""] ||
        [_carRego.text isEqualToString:@""] ||
        [_carYear.text isEqualToString:@""] ||
        [_carLocation.text isEqualToString:@""] ||
        [_fromDate.text isEqualToString:@""] ||
        [_toDate.text isEqualToString:@""]) {
        UIAlertController *fieldAreEmpty = [UIAlertController alertControllerWithTitle:@"Empty" message:@"Please Complete all fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [fieldAreEmpty dismissViewControllerAnimated:YES completion:nil];
                                 NSLog(@"stored car details successfully");
                             }];
        [fieldAreEmpty addAction:ok];
        [self presentViewController:fieldAreEmpty animated:YES completion:nil];

    }
    else{
    
    PFObject *carAdd = [PFObject objectWithClassName:@"car"];
    carAdd[@"make"] = _carMake.text;
    carAdd[@"user"] = [PFUser currentUser].objectId;
    carAdd[@"model"] = _carModel.text;
    carAdd[@"rego"] = _carRego.text;
    carAdd[@"location"] = _carLocation.text;
    carAdd[@"fromDate"] = _fromDate.text;
    carAdd[@"toDate"] = _toDate.text;
    carAdd[@"year"] = _carYear.text;
    [carAdd saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertController *fieldAreEmpty = [UIAlertController alertControllerWithTitle:@"Sucess" message:@"Successfully added to our to Rent A Car" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [fieldAreEmpty dismissViewControllerAnimated:YES completion:nil];
                                     NSLog(@"stored car details successfully");
                                 }];
            [fieldAreEmpty addAction:ok];
            [self presentViewController:fieldAreEmpty animated:YES completion:nil];
            _carMake.text = @"";
            _carModel.text = @"";
            _carRego.text = @"";
            _carYear.text = @"";
            _carLocation.text = @"";
            _fromDate.text = @"";
            _toDate.text = @"";
           
        }
    }];
    
}
}
-(BOOL) textFieldShouldClear:(UITextField *)textField{
    return YES;
}
@end
