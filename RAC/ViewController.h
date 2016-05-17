//
//  ViewController.h
//  RAC
//
//  Created by admin on 14/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    NSString *username;
    NSString *password;
}
@property (weak, nonatomic) IBOutlet UITextField *login_email;
@property (weak, nonatomic) IBOutlet UITextField *login_password;
@property (weak, nonatomic) IBOutlet UIButton *signInAction;
-(IBAction)loginAction:(id)sender;

@end

