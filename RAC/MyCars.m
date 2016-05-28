//
//  MyCars.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "MyCars.h"
#import <Parse/Parse.h>
#import "MyCarCell.h"
@interface MyCars ()
{
    NSMutableArray *myCars;
}
@end

@implementation MyCars
@synthesize myCarTablwView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *user = [PFUser currentUser].objectId;
    
    PFQuery *query = [PFQuery queryWithClassName:@"car"];
    [query whereKey:@"user" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *produtsFromParse, NSError *error) {
        if (produtsFromParse) {
            NSLog(@"%@", produtsFromParse);
            myCars = [[NSMutableArray alloc] initWithArray: produtsFromParse];
            
            
        }
        [myCarTablwView reloadData];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myCars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"MyCarList";
    MyCarCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    PFObject *parseObj = [myCars objectAtIndex:indexPath.row];
    cell.make.text = [parseObj objectForKey:@"make"];
    cell.model.text = [parseObj objectForKey:@"model"];

    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;

{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        PFObject *object = [myCars objectAtIndex:indexPath.row];
        
        [myCars removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
         
         {
             
             if (succeeded) {
                 
                 UIAlertController *fieldAreEmpty = [UIAlertController alertControllerWithTitle:@"Sucess" message:@"Successfully deleted your car from RAC database" preferredStyle:UIAlertControllerStyleAlert];
                 
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
                 [myCarTablwView reloadData];
             }
         }];
    }
    else
    {
    NSLog(@"Error");
    }
}
@end
