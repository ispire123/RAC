//
//  AvaiableCars.h
//  RAC
//
//  Created by admin on 21/05/2016.
//  Copyright © 2016 Rent A Car. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvaiableCars : UITableViewController
{
    NSString *locationSelected;
}
@property (strong, nonatomic) IBOutlet UITableView *carTableView;

@property NSString *location;
@end
