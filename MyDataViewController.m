//
//  MyDataViewController.m
//  MySugar
//
//  Created by Charles Konkol on 10/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MyDataViewController.h"
#import "EmailViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"

@interface MyDataViewController ()
{
        NSMutableArray *_objects;

}

@end

@implementation MyDataViewController
@synthesize MyTable=MyTable;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    listOfData = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"MySugars.sqlite"];
    NSLog(@"Path: %@",path);
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    FMResultSet *results = [database executeQuery:@"select * from mysugar"];
    while([results next]) {
        NSString *id = [results stringForColumn:@"Sugarid"] ;
        NSString *date = [results stringForColumn:@"date"] ;
        NSString *level = [results stringForColumn:@"level"];
        NSString *note  = [results stringForColumn:@"note"];
        NSString *StrSugar =  [NSString stringWithFormat:@"ID:%@  %@  ---- %@ ---- %@", id, date,level, note];
        NSLog(@"Sugar: %@",StrSugar);
        
        [listOfData addObject:StrSugar];
    }
    [results close]; //VERY IMPORTANT!
    [database close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [listOfData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.textLabel.text = [listOfData objectAtIndex:[indexPath row]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row Selected = %i",indexPath.row);
    
   //[self performSegueWithIdentifier:@"EmailDetail" sender:self.view];
    //[self performSegueWithIdentifier:@"EmailDetail" sender:];
   
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    @try {
        //5 Replace existing code with below to setproductname and send to seque object item user clicked on menu
       [segue.destinationViewController  setEmailSugar:[listOfData objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
        

    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    //5 Replace existing code with below to setproductname and send to seque object item user clicked on menu
   // [segue.destinationViewController  setEmailSugar:[listOfData objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
    
}




- (IBAction)btnEmailAll:(id)sender {
    {
      
        @try {
           NSMutableString *exString = [[NSMutableString alloc]init];
            for (NSString *yourVar in listOfData) {
                NSLog (@"Your Array elements are = %@", yourVar);
                [exString appendFormat:@"\n%@",yourVar];
                setEmailSugar:[exString appendFormat:@"\n%@",yourVar];
                NSLog (@"Your Array elements are = %@", yourVar);
            }
            
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
        //5 Replace existing code with below to setproductname and send to seque object item user clicked on menu
        // [segue.destinationViewController  setEmailSugar:[listOfData objectAtIndex:[self.tableView.indexPathForSelectedRow row]]];
        
    }
}
@end
