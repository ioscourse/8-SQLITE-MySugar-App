//
//  MySugarFlipsideViewController.m
//  MySugar
//
//  Created by Charles Konkol on 3/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MySugarFlipsideViewController.h"
#import "FMDatabase.h"
#import "FMResultSet.h"


@interface MySugarFlipsideViewController ()
@property (nonatomic, retain) NSString * dbPath;
@end
@interface keyboardDisappearViewController : UIViewController
<UITextFieldDelegate, UITextViewDelegate>

@end

@implementation MySugarFlipsideViewController
@synthesize dbPath;
@synthesize ViewData=ViewData;


- (void)viewDidLoad
{
    [super viewDidLoad];
   

   ViewData.Text=@"";
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
        NSString *date = [results stringForColumn:@"date"] ;
        NSString *level = [results stringForColumn:@"level"];
        NSString *note  = [results stringForColumn:@"note"];
        NSString *StrSugar =  [NSString stringWithFormat:@"%@ %@ %@", date,level, note];
            ViewData.Text=[NSString stringWithFormat:@"%@\r%@", ViewData.text,StrSugar];
        }
    [results close]; //VERY IMPORTANT!
    [database close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}
- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
    }
    return YES;
}

- (IBAction)btnClear:(id)sender {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"MySugars.sqlite"];
    NSLog(@"Path: %@",path);
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
     [database beginTransaction];
    [database executeUpdate: @"DELETE FROM mysugar",nil];
 [database commit];
       [database close];
     ViewData.Text=@"";
}
@end
