//
//  VOSStatisticsViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 25/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSStatisticsViewController.h"
#import "VOSGame.h"
#import "VOSAction.h"
#import "VOSStatistic.h"
#import "VOSPlayer.h"
#import "VOSTeam.h"
#import "VOSClub.h"

@interface VOSStatisticsViewController ()

@end

@implementation VOSStatisticsViewController

-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           club:(VOSGame *) aGame
                                          style:(UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _game = aGame;
        self.fetchedResultsController = aFetchedResultsController;
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Match in %@ - %@", self.game.localization, self.game.date];
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
    
    // Averiguamos de qué tipo jugada se trata
    VOSStatistic *stat = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    static NSString * cellId = @"statCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    cell.textLabel.text = [NSString stringWithFormat: @"%@ - %@ (%@) %@", stat.action.name, stat.player.name, stat.player.dorsal, stat.player.team.club.name ];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Period: %@ , Time: %@, points: %@", stat.period, stat.time, stat.points ];
    
    // la devolvemos
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSStatistic *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        [ctx deleteObject:deceased];
    }
    
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

@end
