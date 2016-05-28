//
//  Account.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "Account.h"
#import <Parse/Parse.h>
@interface Account ()

@end

@implementation Account

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _name.text = [[PFUser currentUser] objectForKey:@"name"];
    
    
    _email.text = [[PFUser currentUser] objectForKey:@"email"];
    
    _phone.text = [[PFUser currentUser]objectForKey:@"phone"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)updateAction:(id)sender {
    
    PFUser *user = [PFUser currentUser];
    user.username = _email.text;
    
    user[@"email"] = _email.text;
    user[@"phone"] = _phone.text;
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertController *fieldAreEmpty = [UIAlertController alertControllerWithTitle:@"Success" message:@"Email Successfully changes remember your login has changed to a new Email" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [fieldAreEmpty dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
            
            
            [fieldAreEmpty addAction:ok];
            [self presentViewController:fieldAreEmpty animated:YES completion:nil];
            
        }
        else if(error){
            UIAlertController *fieldAreEmpty = [UIAlertController alertControllerWithTitle:@"Failed" message:@"Please enter a valid email address" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [fieldAreEmpty dismissViewControllerAnimated:YES completion:nil];
                                     
                                 }];
            
            
            [fieldAreEmpty addAction:ok];
            [self presentViewController:fieldAreEmpty animated:YES completion:nil];
        }
    }];

}
@end
