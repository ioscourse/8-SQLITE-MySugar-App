//
//  MySugarMainViewController.h
//  MySugar
//
//  Created by Charles Konkol on 3/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "MySugarFlipsideViewController.h"

@interface MySugarMainViewController : UIViewController <MySugarFlipsideViewControllerDelegate>
{
    IBOutlet UIScrollView *scrollView;
        IBOutlet UITextView *TextViews;
}
@property (strong, nonatomic) IBOutlet UITextField *txtBloodSugar;
- (IBAction)btnSave:(id)sender;
-(IBAction) doneEditing:(id) sender;
//keyboard hide when bg touched
@property (nonatomic, retain) UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *TextViews;

@end
