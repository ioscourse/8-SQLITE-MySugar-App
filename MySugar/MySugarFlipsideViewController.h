//
//  MySugarFlipsideViewController.h
//  MySugar
//
//  Created by Charles Konkol on 3/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MySugarFlipsideViewController;

@protocol MySugarFlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(MySugarFlipsideViewController *)controller;
@end

@interface MySugarFlipsideViewController : UIViewController

@property (weak, nonatomic) id <MySugarFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *ViewData;

- (IBAction)btnClear:(id)sender;


@end
