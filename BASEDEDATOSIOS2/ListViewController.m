//
//  ListViewController.m
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import "ListViewController.h"
#import "Peliculas.h"
#import "DetailViewController.h"
#import "agregarViewController.h"
@interface ListViewController ()

@end

@implementation ListViewController

@synthesize PeliculasArray;

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
    
    PeliculasArray = [[NSMutableArray alloc]init];
    [self loadPeliculasFromDB];
    [tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [PeliculasArray count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *simpleTableIdentifiquer=@"detailCell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifiquer];
    
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifiquer];
    }
    
    /*UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailCell"];*/
    
    cell.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:125.0/255.0 blue:255.0/255.0 alpha:1.0];
    cell.contentView.backgroundColor = [UIColor colorWithRed:221.0/255.0 green:238.0/255.0 blue:255.0/255.0 alpha:1.0];
    
    // Creamos una etiqueta (UILabel) para mostrar el nombre de los tutoriales en cada fila.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 0.0, cell.frame.size.width - 40, tableView.rowHeight)];
    
    
    //label.textAlignment = UITextAlignmentLeft;
    
    
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20.0];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(1, 1);
    
    // Le establecemos el nombre según el tutorial recuperado del array
    Peliculas *auxPeliculas = [PeliculasArray objectAtIndex:indexPath.row];
    label.text = [auxPeliculas name];
    
    // Y añadimos la etiqueta al contenido de la vista.
    [cell.contentView addSubview:label];
    
    
    
    
    return cell;
    
    
}


- (void)loadPeliculasFromDB
{
    sqlite3 *database;
    
    
    sqlite3_stmt *compiledStatement;
    
    
    
    // Abrimos la base de datos de la ruta indicada en el delegate
    if(sqlite3_open([appDelegate.databasePath UTF8String], &database) == SQLITE_OK) {
        
        
        // Podríamos seleccionar solo algunos, o todos en el orden deseado así:
        // NSString *sqlStatement = [NSString stringWithFormat:@"seletc id_tutorial, sistema, nombre, terminado from Tutoriales"];
        NSString *sqlStatement = [NSString stringWithFormat:@"select * from Peliculas"];
        
        
        
        // Lanzamos la consulta y recorremos los resultados si todo ha ido OK
        if(sqlite3_prepare_v2(database, [sqlStatement UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK) {
            
            // Recorremos los resultados. En este caso no habrá.
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                // Leemos las columnas necesarias. Aunque algunos valores son numéricos, prefiero recuperarlos en string y convertirlos luego, porque da menos problemas.
                NSString *Nombre = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 0)];
                NSString *Descripcion = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *Puntuacion = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                NSString *Visto = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                NSString *id_peliculas = [NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                
                
                
                Peliculas *auxPeliculas = [[Peliculas alloc]init];
                
                auxPeliculas.name=Nombre;
                auxPeliculas.descrip = Descripcion;
                auxPeliculas.puntuacion = [Puntuacion intValue];
                auxPeliculas.visto = [Visto intValue];
                auxPeliculas.idpeliculas = [id_peliculas intValue];
                
                [PeliculasArray addObject:auxPeliculas];
                NSLog(@"Peliculas count = %lu",(unsigned long)[PeliculasArray count]);
                
                
            }
            
            
            
        } else {
            // Informo si ha habido algún error
        }
        
        // Libero la consulta
        sqlite3_finalize(compiledStatement);
        
    }
    // Cierro la base de datos
    sqlite3_close(database);
    
}


/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Establecemos al controlador el tutorial que debemos pasarle.
    //[detailController setAuxPeliculas:auxPeliculas];
    
    
    
    // En este método haremos lo que creamos oportuno. Por lo general pasaremos a una vista detalle del elemento seleccionado. Haciendo uso de  UINavigationController que se puede ver en el correspondiente tutorial.
    //Peliculas *datoString = [PeliculasArray objectAtIndex:indexPath.row];
    
UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:[NSString stringWithFormat:@"Has pulsado la fila %d",indexPath.row]
                          message:[NSString stringWithFormat:@"¡No te olvides de agregar %@ a tus marcadores!",datoString]
                          delegate:nil
                          cancelButtonTitle:@"Aceptar"
                          otherButtonTitles:nil, nil];
    [alert show];

    
    
    
    
    
    
    // Lanzamos el controlador de detalle de nuestro tutorial.
    
    //[self.navigationController pushViewController:agregar animated:YES];
}
*/




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        NSIndexPath *path = [tableView indexPathForSelectedRow];
        
        // DetailViewController *detailController = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
        
        
        Peliculas *auxPeliculas = [PeliculasArray objectAtIndex:path.row];
        
        //[detailController setAuxTutorial:auxTutorial];
        
        
        [segue.destinationViewController setAuxPeliculas:auxPeliculas];
    }
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

@end
