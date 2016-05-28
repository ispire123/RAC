//
//  ForgotPassword.m
//  RAC
//
//  Created by admin on 27/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "ForgotPassword.h"
#import <Parse/Parse.h>
@interface ForgotPassword ()

@end

@implementation ForgotPassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)sendEmail:(id)sender {
    
    [PFUser requestPasswordResetForEmailInBackground:_email.text block:^(BOOL succeeded, NSError * error) {
        if (succeeded) {
            UIAlertController *registrationError = [UIAlertController alertControllerWithTitle:@"Success" message:@"Please check your email" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                [registrationError dismissViewControllerAnimated:YES completion:nil];
                
            }];
            [registrationError addAction:ok];
            [self presentViewController:registrationError animated:YES completion:nil];

            
        }
        else{
            UIAlertController *registrationError = [UIAlertController alertControllerWithTitle:@"Error" message:@"This Email is not registered with RAC" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                [registrationError dismissViewControllerAnimated:YES completion:nil];
                
            }];
            [registrationError addAction:ok];
            [self presentViewController:registrationError animated:YES completion:nil];
        }
    }];
}

@end
