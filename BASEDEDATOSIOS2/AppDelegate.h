//
//  AppDelegate.h
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    NSString *databaseName;
	NSString *databasePath;

}


@property (strong, nonatomic) UIWindow *window;

// Variables de la base de datos
@property (nonatomic, retain) NSString *databaseName;
@property (nonatomic, retain) NSString *databasePath;


-(void)loadDB;


@end
