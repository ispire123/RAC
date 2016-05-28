//
//  CompleteDetails.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "CompleteDetails.h"
#import <Parse/Parse.h>
@interface CompleteDetails ()

@end

@implementation CompleteDetails
@synthesize userId;
- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFUser query];
    //[query whereKey:@"gender" equalTo:@"female"];
    // find all the women
    [query getObjectInBackgroundWithId:userId block:^(PFObject * object, NSError *error) {
        
        _ownerName.text = [object objectForKey:@"name"];
        _PhoneNumber.text = [object objectForKey:@"phone"];
        _emailId.text = [object objectForKey:@"email"];
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)contactCustomer:(id)sender {
    
    UIApplication *myApp = [UIApplication sharedApplication];
    NSString *theCall = [NSString stringWithFormat:@"tel://%@",_PhoneNumber.text];
    NSLog(@"making call with %@",theCall);
    [myApp openURL:[NSURL URLWithString:theCall]];
}
@end
