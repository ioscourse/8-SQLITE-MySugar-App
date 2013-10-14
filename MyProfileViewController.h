//
//  MyProfileViewController.h
//  MySugar
//
//  Created by Charles Konkol on 3/12/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MyProfileViewController : UIViewController
{
    IBOutlet UIScrollView *ScrollView;
}
@property (strong, nonatomic) IBOutlet UITextField *txtFullName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
- (IBAction)btnSave:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollView;
-(IBAction) doneEditing:(id) sender;
@end
