//
//  MySugarAppDelegate.h
//  MySugar
//
//  Created by Charles Konkol on 3/10/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySugarAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//database path
@property NSString *databasename;
@property NSString *databasepath;
@property NSArray *documentPaths;
@property NSString *documentsDir;
@property NSFileManager *appdelfilemanager;
@end
