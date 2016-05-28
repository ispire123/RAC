//
//  ForgotPassword.h
//  RAC
//
//  Created by admin on 27/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassword : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
- (IBAction)sendEmail:(id)sender;

@end
