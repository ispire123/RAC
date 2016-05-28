//
//  CompleteDetails.h
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompleteDetails : UIViewController
@property NSString *userId;
//@property (weak, nonatomic) IBOutlet UITextField *ownerName;
@property (weak, nonatomic) IBOutlet UILabel *ownerName;
@property (weak, nonatomic) IBOutlet UILabel *PhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *emailId;
@property (weak, nonatomic) IBOutlet UILabel *location;
- (IBAction)contactCustomer:(id)sender;

@end
