//
//  agregarViewController.h
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Peliculas.h"

@interface agregarViewController : UIViewController
{
 AppDelegate *appDelegate;
    Peliculas *auxPeliculas;

}


@property (strong, nonatomic) IBOutlet UITextField *name;

@property (strong, nonatomic) IBOutlet UITextField *descrip;

@property (strong, nonatomic) IBOutlet UITextField *puntuacion;


@property (strong, nonatomic) IBOutlet UITextField *visto;


@property (strong, nonatomic) IBOutlet UITextField *idpeliculas;






- (IBAction)InsertarPelicula:(id)sender;

-(IBAction)esconderTeclado;


@end
