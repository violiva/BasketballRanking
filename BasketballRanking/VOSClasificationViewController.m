//
//  VOSClasificationViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 4/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSClasificationViewController.h"
#import "VOSGroup.h"
#import "VOSClasification.h"
#import "VOSTeam.h"
#import "VOSDetailClasificationViewController.h"
#import "VOSClub.h"

@interface VOSClasificationViewController ()
{
    NSFetchedResultsController *frcTeam;
}
@end

@implementation VOSClasificationViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // agregamos el botón de añadir clasificación
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                          target:self
                                                                          action:@selector( addClasif: )];
    self.navigationItem.rightBarButtonItem = btn;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Teams in Group: %@", self.group.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar la clasificación a mostrar
    VOSClasification * clasif = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"clasificationCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", clasif.team.club.name, clasif.team.name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"PT: %d, PU: %d, PA: %d, Dif: %d", clasif.totalPoints.intValue,
                                 clasif.pointsForUs.intValue, clasif.pointsAgainst.intValue, clasif.dif.intValue  ];
    
    // la devolvemos
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        VOSClasification * deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        NSManagedObjectContext * ctxt = self.group.managedObjectContext;
        
        [ctxt deleteObject:deceased];
    }
}


// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}


#pragma mark - Actions
-(void) addClasif:(id) sender{

    VOSDetailClasificationViewController *newClasifVC = [[VOSDetailClasificationViewController alloc] initForNewClasificationInGroup:self.group];

    [self.navigationController pushViewController:newClasifVC animated:YES];

}

- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated:(BOOL)flag
                   completion:(void (^)(void))completion{
    
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguar el grupo
    VOSClasification * clasification = [self.fetchedResultsController objectAtIndexPath:indexPath];

    // Creamos el controlador
    VOSDetailClasificationViewController *updateClasifVC = [[VOSDetailClasificationViewController alloc] initWithModel:clasification ];
    
    // lo pusheamos
    [self.navigationController pushViewController:updateClasifVC animated:YES];
}

@end
