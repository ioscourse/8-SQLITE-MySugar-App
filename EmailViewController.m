//
//  EmailViewController.m
//  MySugar
//
//  Created by Charles Konkol on 10/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "EmailViewController.h"
#import "FMDatabase.h"
//#import "FMDatabaseQueue.h"
#import "FMResultSet.h"

@implementation EmailViewController
@synthesize emailSugar;
@synthesize txtFullName;
@synthesize txtDoctorEmail;
@synthesize txtEmail;
@synthesize scrollView=scrollView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if (![emailSugar isEqual: @""])
    {
        NSString *Email = emailSugar;
    self.txtEmail.text = Email;
    }
    
    NSInteger id;
    NSString *fullname;
    NSString *email;
	// Do any additional setup after loading the view.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsPath = [paths objectAtIndex:0];
    NSString *path = [docsPath stringByAppendingPathComponent:@"MySugars.sqlite"];
    //NSLog(@"Path: %@",path);
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    [database open];
	// Do any additional setup after loading the view, typically from a nib.
    // Do any additional setup after loading the view, typically from a nib.
    FMResultSet *results = [database executeQuery:@"select * from personal"];
    while([results next]) {
        id = [results intForColumn:@"Personalid"]  ;
        fullname = [results stringForColumn:@"fullname"] ;
        email = [results stringForColumn:@"email"] ;
    }
    NSLog(@"id: %ld",(long)id);
    NSLog(@"FullName: %@",fullname);
    NSLog(@"email: %@",email);
    if (id != 1)
    {
        // Do any additional setup after loading the view, typically from a nib.
        //Date to write
        
        //[database executeUpdate:@"insert into Personal(fullname, email) values(?,?)",
        // @"Enter Full Name",@"Enter Email"];
        txtDoctorEmail.text = @"Enter Full Name";
        txtFullName.text = @"Enter Email";
    }
    else
    {
        txtDoctorEmail.text = email;
        txtFullName.text = fullname;
    }
    
    
    // NSLog(@"Path: %int",(int)id);
    
    [results close]; //VERY IMPORTANT!
    [database close];

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyboard {
    [txtEmail resignFirstResponder];
    [txtDoctorEmail resignFirstResponder];
    [txtFullName resignFirstResponder];
}

- (IBAction)btnSendEmail:(id)sender {
    [txtFullName resignFirstResponder];
    [txtDoctorEmail resignFirstResponder];
    [txtEmail resignFirstResponder];
    if ([MFMailComposeViewController canSendMail])
    {
        // Email Subject
        NSString *emailTitle = @"My Sugar App";
        // Email Content
        NSString *messageBody = txtEmail.text; // Change the message body to HTML
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:txtDoctorEmail.text];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:YES];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
     
    }
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, textView.frame.origin.y);
    [scrollView setContentOffset:scrollPoint animated:YES];
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    [scrollView setContentOffset:CGPointZero animated:YES];
}
@end
