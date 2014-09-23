//
//  ViewController.m
//  BASEDEDATOSIOS2
//
//  Created by Miguel Mexicano on 06/09/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
#import "NuevoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)listado
{
    ListViewController *listController = [[ListViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:listController animated:YES];
}



/*- (IBAction)Mexi:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
    
    ViewController *mexi = [[NuevoViewController alloc] init];

    [self presentModalViewController:mexi animated:YES];
    
    
    
}*/
@end
