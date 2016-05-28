//
//  Registration.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "Registration.h"
#import <Parse/Parse.h>

@interface Registration ()

@end

@implementation Registration

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

- (IBAction)registerAction:(id)sender {
    
        PFUser *user = [PFUser user];
        user.username = _email.text;
        user.password = _password.text;
        user.email = _email.text;
        user[@"phone"] = _mobile.text;
        user[@"name"] = _name.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
            if (succeeded) {
                UIAlertController *registrationError = [UIAlertController alertControllerWithTitle:@"SignUp success" message:@"Registration completed successfully" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Login" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                    [registrationError dismissViewControllerAnimated:YES completion:nil];
                    UIViewController *tabView = [self.storyboard instantiateViewControllerWithIdentifier:@"loginScreen"];
                    [self presentViewController:tabView animated:YES completion:nil];
                    
                }];
                [registrationError addAction:ok];
                [self presentViewController:registrationError animated:YES completion:nil];
                
            }
            else{
                UIAlertController *registrationError = [UIAlertController alertControllerWithTitle:@"LogOn Failed" message:@"The Email Address Already Taken" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
                    [registrationError dismissViewControllerAnimated:YES completion:nil];
                }];
                [registrationError addAction:ok];
                [self presentViewController:registrationError animated:YES completion:nil];
            }
        }];
        
    }
@end
