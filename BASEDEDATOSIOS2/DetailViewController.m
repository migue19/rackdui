//
//  DetailViewController.m
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 07/09/14.
//  Copyright (c) 2014 Miguel Mexicano. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize auxPeliculas;

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
    
    
    labelNombre.text = auxPeliculas.name;
    labelDescipcion.text=auxPeliculas.descrip;
    labelPuntuacion.text=[NSString stringWithFormat:@"%d",auxPeliculas.puntuacion];
    labelVisto.text=[NSString stringWithFormat:@"%d",auxPeliculas.visto];
    
    
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

@end
