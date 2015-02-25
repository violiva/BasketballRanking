//
//  VOSPlayersViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPlayersViewController.h"

#import "VOSTeam.h"
#import "VOSPhotoContainer.h"
#import "VOSEditPlayerViewController.h"
#import "VOSPlayer.h"
#import "VOSClub.h"
#import "VOSPhotoContainer.h"

@interface VOSPlayersViewController ()

@end

@implementation VOSPlayersViewController
-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           team:(VOSTeam *) aTeam
                                          style:(UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _teamEdit = aTeam;
        self.fetchedResultsController = aFetchedResultsController;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = [NSString stringWithFormat:@"%@ Players", self.teamEdit.name];
    
    // agregamos el botón de añadir Equipos.
    UIBarButtonItem * b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:self
                                                                        action:@selector( addPlayer: )];
    self.navigationItem.rightBarButtonItem = b;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.
-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué Jugador se trata
    VOSPlayer * player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    static NSString * cellId = @"playerCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    // la configuramos
    cell.imageView.image = player.photo.image ;
    cell.textLabel.text = player.name ;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Dorsal %@", player.dorsal];
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    // la devolvemos
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSPlayer *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        [ctx deleteObject:deceased];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addPlayer:(id) sender{
    [VOSPlayer playerWithName:[NSString stringWithFormat:@"New Player from %@ Team", self.teamEdit.name]
                     team:self.teamEdit
                  context:self.fetchedResultsController.managedObjectContext];
}

#pragma mark - Table View Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguamos cual es el jugador a modificar
    VOSPlayer * player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSLog(@"Vamos a modificar la información del jugador: %@ del equipo %@ del Club %@", player.name, self.teamEdit.name, self.teamEdit.club.name);
    
    // crear formulario para modificar los datos del Equipo
    VOSEditPlayerViewController * editPlayerVC = [[VOSEditPlayerViewController alloc] initWithModel:player];
    
    // Hacerle push
    [self.navigationController pushViewController:editPlayerVC animated:YES];
}


-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    VOSPlayer * player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"Desde aquí podríamos mostrar información de estadísticas de este jugador %@ del equipo %@ del Club %@ ", player.name, self.teamEdit.name, self.teamEdit.club.name);
}

@end
