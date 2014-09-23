//
//  ListViewController.h
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface ListViewController : UIViewController
{
// Declaramos la tabla y el delegate de la aplicación
IBOutlet UITableView *tableView;
AppDelegate *appDelegate;
}


@property (nonatomic, retain) NSMutableArray *PeliculasArray;

// Añadimos un método para la carga de nuestra base de datos.
- (void)loadPeliculasFromDB;

@end
