//
//  AvaiableCars.m
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import "AvaiableCars.h"
#import <Parse/Parse.h>
#import "CarDetailCell.h"
#import "CompleteDetails.h"
@interface AvaiableCars ()
{
    NSArray *product;
    NSString *user;
    NSString *carLocation;
}

@end

@implementation AvaiableCars
@synthesize carTableView;
@synthesize location;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *userID = [PFUser currentUser].objectId ;
    PFQuery *query = [PFQuery queryWithClassName:@"car"];
    [query whereKey:@"location" equalTo:location];
    [query findObjectsInBackgroundWithBlock:^(NSArray *produtsFromParse, NSError *error) {
        if (produtsFromParse) {
            NSLog(@"%@", produtsFromParse);
            product = [[NSMutableArray alloc] initWithArray: produtsFromParse];
            
            
        }
        [carTableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return product.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"carListCell";
    CarDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    PFObject *parseObj = [product objectAtIndex:indexPath.row];
    cell.carMake.text = [parseObj objectForKey:@"make"];
    cell.carModel.text = [parseObj objectForKey:@"model"];
    cell.carRego.text = [parseObj objectForKey:@"rego"];
    cell.carLocation.text = [parseObj objectForKey:@"location"];
    carLocation = [parseObj objectForKey:@"location"];
    cell.fromDate.text = [parseObj objectForKey:@"fromDate"];
    cell.toDate.text = [parseObj objectForKey:@"toDate"];
    user = [parseObj objectForKey:@"user"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"carOwnerPush"]) {
        CompleteDetails *nextView = segue.destinationViewController;
        
        nextView.userId = user;
        nextView.location.text = carLocation;
    }
}

@end
