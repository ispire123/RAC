//
//  CarDetailCell.h
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carMake;
@property (weak, nonatomic) IBOutlet UILabel *carModel;
@property (weak, nonatomic) IBOutlet UILabel *fromDate;
@property (weak, nonatomic) IBOutlet UILabel *toDate;
@property (weak, nonatomic) IBOutlet UILabel *carRego;
@property (weak, nonatomic) IBOutlet UILabel *carLocation;

@end
