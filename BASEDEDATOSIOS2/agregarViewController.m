//
//  agregarViewController.m
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import "agregarViewController.h"

#import <sqlite3.h>
#import "AppDelegate.h"

@interface agregarViewController ()

@end

@implementation agregarViewController

@synthesize name,descrip,visto,idpeliculas,puntuacion;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)InsertarPelicula:(id)sender {
    
    // Comprobamos que el usuario haya insertado un nombre, si no, no haremos cambio. podéis crear si quereis un UIAlertView para avisar al usuario. Nosotros ahora lo vamos a obviar.
    if(![name.text isEqualToString:@""])
    {
        // En caso de que si que tenga nombre, comprobamos si auxTutorial existe. De no ser así (que debería ser lo normal), lo iniciamos.
        if(auxPeliculas == nil)
        {
            auxPeliculas = [[Peliculas alloc]init];
            
        }
        
        // Establecemos el nombre al objeto.
        auxPeliculas.name = name.text;
        auxPeliculas.descrip = descrip.text;
        auxPeliculas.puntuacion=[puntuacion.text integerValue];
        auxPeliculas.visto=[visto.text integerValue];
        
        
        
     
        
        
        
        // Ahora instanciamos la variable database de tipo sqlite3
sqlite3 *database;
        
        // Creamos el sqlite3_stmt que contendrá después la sentencia a ejecutar compilada.
sqlite3_stmt *compiledStatement;
        
        
        // Abrimos la base de datos de la ruta indicada en el delegate
        if(sqlite3_open([appDelegate.databasePath UTF8String], &database)== SQLITE_OK) {
            
            // Si no ha habido errores al abrir, creamos la sentencia de inserción.
            // Como id_noticia es autoincremental, no lo indicaremos nosotros.
        
            NSString *sqlStatement = [NSString stringWithFormat:@"Insert into Peliculas(\"Nombre\",\"Descripcion\", \"Puntuacion\", \"Visto\") VALUES (\"%@\",\"%@\",\"%d\",\"%d\")",auxPeliculas.name,auxPeliculas.descrip,auxPeliculas.puntuacion,auxPeliculas.visto];
            
        
            
            
            // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
            if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
                
                // En otros casos recorremos los resultados. En este caso no habrá.
                while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    
                }
                
            } else {
                
                NSLog(@"no se pudo insertar");
                // Puedo informar si ha habido algún error
            }
            
            // Libero la consulta
            sqlite3_finalize(compiledStatement);
            
        }
        // Cierro la base de datos
        sqlite3_close(database);
        
        // Si todo ha ido bien podemos abandonar la ventana e ir a la superior.
        //Aquí también podéis utilizar un UIAlertView para notificar al usuario de que la inserción ha sido correcta.
        [self.navigationController popViewControllerAnimated:YES];
        
        
        
    }
    

    
    
}


-(IBAction)esconderTeclado
{
    [name resignFirstResponder];
    
}






@end
