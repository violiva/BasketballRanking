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
    UIColor *clearGrey = [UIColor colorWithRed:227.0/255.0
                                         green:227.0/255.0
                                          blue:227.0/222.0
                                         alpha:1];
    [[UITableViewHeaderFooterView appearance] setTintColor:clearGrey];

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
    cell.textLabel.textColor = [UIColor blackColor];
    cell.imageView.image = nil;

    if ( stat.pointsValue > 0 ){
        cell.imageView.image = [UIImage imageNamed:@"Ok.png"];
    }else{
        if ( [stat.action.name isEqualToString:@"Falta cometida"] ){
            cell.textLabel.textColor = [UIColor redColor];
            cell.imageView.image = [UIImage imageNamed:@"Red_Cross.png"];
        }
    }
    
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    cell.textLabel.text = [NSString stringWithFormat: @"%@ - %@ (%@) %@", stat.action.name, stat.player.name, stat.player.dorsal, stat.player.team.club.name ];
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Period: %@ , Time: %@, points: %@", stat.period, stat.time, stat.points ];
    
    // la devolvemos
    return cell;
    
}

/*
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    [headerView setBackgroundColor:[UIColor redColor]];

    UILabel *tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    tempLabel.backgroundColor=[UIColor clearColor];
    tempLabel.shadowColor = [UIColor blackColor];
    tempLabel.shadowOffset = CGSizeMake(0,2);
    tempLabel.textColor = [UIColor whiteColor]; //here you can change the text color of header.
    tempLabel.font = [UIFont fontWithName:@"Dosis" size:20];
    tempLabel.text = [NSString stringWithFormat:@"%d", section];
    
    [headerView addSubview:tempLabel];
    
    return headerView;
}
*/

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSStatistic *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        if (deceased.points > 0) {
            if (deceased.player.team == self.game.homeTeam) {
                NSNumber *sum = [NSNumber numberWithFloat:([self.game.pointHome floatValue] - [deceased.points floatValue])];
                self.game.pointHome = sum;
            }

            if (deceased.player.team == self.game.awayTeam) {
                NSNumber *sum = [NSNumber numberWithFloat:([self.game.pointVisit floatValue] - [deceased.points floatValue])];
                self.game.pointVisit = sum;
            }
            
        }
        
        // la elimino
        [ctx deleteObject:deceased];
    }
    
}

// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

@end
