//
//  VOSTeamsViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTeamsViewController.h"

#import "VOSTeam.h"
#import "VOSLogo.h"
#import "VOSEditTeamViewController.h"
#import "VOSClub.h"
#import "VOSPlayer.h"
#import "VOSPlayersViewController.h"

@interface VOSTeamsViewController ()

@end

@implementation VOSTeamsViewController

-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           club:(VOSClub *) aClub
                                          style:(UITableViewStyle) aStyle{
 
    if (self = [super initWithStyle:aStyle]) {
        _clubEdit = aClub;
        self.fetchedResultsController = aFetchedResultsController;
    }
    return self;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"%@ Teams", self.clubEdit.name];

    // agregamos el botón de añadir Equipos.
    UIBarButtonItem * b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:self
                                                                        action:@selector( addTeam: )];
    self.navigationItem.rightBarButtonItem = b;
    
}

-(void)viewWillAppear:(BOOL)animated{
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
    
    // Averiguamos de qué Equipo se trata
    VOSTeam * team = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    static NSString * cellId = @"TeamCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    // la configuramos
    cell.imageView.image = self.clubEdit.logo.image ;
    cell.textLabel.text = team.name ;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", team.colour, team.year];
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    // la devolvemos
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSTeam *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        [ctx deleteObject:deceased];
    }
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addTeam:(id) sender{
    [VOSTeam teamWithName:[NSString stringWithFormat:@"New Team from %@ Club", self.clubEdit.name]
                     club:self.clubEdit
                  context:self.fetchedResultsController.managedObjectContext];
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguamos cual es el equipo a modificar
    VOSTeam * team = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSLog(@"Vamos a modificar la información del equipo: %@ del Club %@ ", team.name, team.club.name);

    // crear formulario para modificar los datos del Equipo
    VOSEditTeamViewController * editTeamVC = [[VOSEditTeamViewController alloc] initWithModel:team];
    
    // Hacerle push
    [self.navigationController pushViewController:editTeamVC animated:YES];
}


-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    VOSTeam * team = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSLog(@"Vamos a gestionar los jugadores del equipo %@ del Club %@ ", team.name, team.club.name);
    
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSPlayer entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSPlayerAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"team == %@", team];
    NSFetchedResultsController * frcTeam = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                               managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                                 sectionNameKeyPath:nil
                                                                                          cacheName:nil ];
    
    // Creamos el nuevo controlador y le pasamos el nombre del Club que lo sepa
    VOSPlayersViewController * playerVC = [[VOSPlayersViewController alloc] initWithFetchedResultsController:frcTeam
                                                                                                  team:team
                                                                                                 style:UITableViewStylePlain];
    // Lo pusheo
    [self.navigationController pushViewController:playerVC
                                         animated:YES];
}

@end
