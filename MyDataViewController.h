//
//  MyDataViewController.h
//  MySugar
//
//  Created by Charles Konkol on 10/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDataViewController : UITableViewController
{
    //Declare Arrays
    NSMutableArray *listOfData;
}
@property (strong, nonatomic) IBOutlet UITableView *MyTable;
- (IBAction)btnEmailAll:(id)sender;

@end
