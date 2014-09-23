//
//  Peliculas.h
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Peliculas : NSObject


@property(nonatomic) int idpeliculas;
@property(nonatomic, retain) NSString *descrip;
@property(nonatomic, retain) NSString *name;
@property(nonatomic) int puntuacion;
@property(nonatomic) int visto;


@end
