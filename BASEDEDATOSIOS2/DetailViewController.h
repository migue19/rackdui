//
//  DetailViewController.h
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 07/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Peliculas.h"

@interface DetailViewController : UIViewController
{

    IBOutlet UILabel *labelNombre;
    IBOutlet UILabel *labelDescipcion;

    IBOutlet UILabel *labelPuntuacion;

    IBOutlet UILabel *labelVisto;


}


@property (nonatomic,retain) Peliculas *auxPeliculas;

@end
