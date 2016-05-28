//
//  ViewController.m
//  RAC
//
//  Created by admin on 14/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginAction:(id)sender{
    
    NSLog(@"%@", _login_email.text);
    NSLog(@"%@", _login_password.text);
}

- (IBAction)forget_password:(UIButton *)sender {
}


@end
