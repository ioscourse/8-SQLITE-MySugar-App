//
//  EmailViewController.h
//  MySugar
//
//  Created by Charles Konkol on 3/12/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface EmailViewController : UIViewController
{
        IBOutlet UIScrollView *scrollView;
        NSString *emailSugar;
}
@property (weak, nonatomic) IBOutlet UITextView *txtEmail;
@property (strong, nonatomic) NSString *emailSugar;
@property (weak, nonatomic) IBOutlet UITextField *txtFullName;
@property (weak, nonatomic) IBOutlet UITextField *txtDoctorEmail;
@property (nonatomic, retain) UIScrollView *scrollView;
- (IBAction)btnSendEmail:(id)sender;

-(IBAction) doneEditing:(id) sender;

@end
