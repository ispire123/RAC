//
//  Login.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "Login.h"
#import <Parse/Parse.h>

@interface Login ()

@end

@implementation Login

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

- (IBAction)signIn:(id)sender {
    [PFUser logInWithUsernameInBackground:_email.text password:_password.text
    block:^(PFUser *user, NSError *error) {
    if (!(error)) {
    //[self performSegueWithIdentifier:@"loginSuccess" sender:self];
    NSLog(@"Should change to dashboard here");
    UIStoryboard *dashboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *tabView = [dashboard instantiateViewControllerWithIdentifier:@"HomeTabScreen"];
    [self presentViewController:tabView animated:YES completion:nil];
    }
    else
    {
    // The login failed. Check error to see why.
    NSLog(@"login failed");
    UIAlertController *wronglogin = [UIAlertController alertControllerWithTitle:@"Failed" message:@"Please enter your correct username and password" preferredStyle:UIAlertControllerStyleAlert];
                                            
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action)
                        {
                        [wronglogin dismissViewControllerAnimated:YES completion:nil];
                                                                     
                        }];
                        UIAlertAction* fg = [UIAlertAction
                        actionWithTitle:@"forgot password"
                        style:UIAlertActionStyleDefault
                        handler:^(UIAlertAction * action)
                        {
                         UIViewController *forgot = [self.storyboard instantiateViewControllerWithIdentifier:@"forgotPassword"];
                         [self presentViewController:forgot animated:YES completion:nil];
                                                                     
                        }];
                        [wronglogin addAction:ok];
                        [wronglogin addAction:fg];
                        [self presentViewController:wronglogin animated:YES completion:nil];
                                            
                        }
        }];
}
@end
