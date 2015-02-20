//
//  VOSClubsViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSClubsViewController.h"
#import "VOSClub.h"
#import "VOSLogo.h"
#import "VOSEditClubViewController.h"

@interface VOSClubsViewController ()

@end

@implementation VOSClubsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Clubs";

    // agregamos el botón de añadir notas.
    UIBarButtonItem * b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:self
                                                                        action:@selector( addClub: )];
    
    self.navigationItem.rightBarButtonItem = b;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    // Averiguamos de qué Club se trata
    VOSClub * club = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    static NSString * cellId = @"ClubCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.imageView.image = club.logo.image;
    cell.textLabel.text = club.name ;
    cell.detailTextLabel.text = club.address;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];

    // la devolvemos
    return cell;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSClub *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        [ctx deleteObject:deceased];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addClub:(id) sender{
    [VOSClub clubWithName:@"Nuevo Club"
                  context:self.fetchedResultsController.managedObjectContext];
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguamos cual es el Club
    VOSClub * club = [self.fetchedResultsController objectAtIndexPath:indexPath];
  
    // crear formulario para el Club
    VOSEditClubViewController * editClubVC = [[VOSEditClubViewController alloc] initWithModel:club];
    
    // Hacerle push
    [self.navigationController pushViewController:editClubVC animated:YES];

}

@end