//
//  VOSGamesViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSGamesViewController.h"
#import "VOSGame.h"
#import "VOSTeam.h"
#import "VOSClub.h"
#import "VOSCategory.h"
#import "VOSGroup.h"
#import "VOSSelectNewGameViewController.h"

@interface VOSGamesViewController ()

@end

@implementation VOSGamesViewController

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Añadimos botón para añadir nueva Categoría.
    UIBarButtonItem * addBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector( addGame: )];
    self.navigationItem.rightBarButtonItem = addBtn;
    
    UIImage* anImage1 = [UIImage imageNamed:@"Settings_Select.png"];
    UIImage* anImage2 = [UIImage imageNamed:@"Settings_unSelect.png"];
    
    [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Games"
                                                      image: anImage1
                                              selectedImage:anImage2]];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = @"Games";
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué partido se trata
    VOSGame * game = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"gameCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/YYYY HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:game.date];

    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", game.localization, dateString];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%d) - %@ (%d)", game.homeTeam.club.name, game.pointHome.intValue, game.awayTeam.club.name, game.pointVisit.intValue];
    
    // la devolvemos
    return cell;
    
}


// Personalización del título del botón que aparece con el gesto de deslizar a la izquierda. Por defecto viene como Delete.
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remove";
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar si el usuario quiere definitivamente eliminar el registro
    if ( editingStyle == UITableViewCellEditingStyleDelete ){
        
        // Averiguo la celda
        NSManagedObjectContext * ctx = self.fetchedResultsController.managedObjectContext;
        VOSGame *deceased = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // la elimino
        [ctx deleteObject:deceased];
    }
}

#pragma mark - Actions
-(void) addGame:(id) sender{

    // Primero vamos a averiguar si tenemos definidos Grupos
    NSFetchRequest *reqGroup = [NSFetchRequest fetchRequestWithEntityName:[VOSGroup entityName]];
    
    reqGroup.fetchBatchSize = 30;
    reqGroup.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"category.name"
                                                                ascending:NO
                                                                 selector:@selector(caseInsensitiveCompare:)],
                                  [NSSortDescriptor sortDescriptorWithKey:VOSGroupAttributes.name
                                                                ascending:NO
                                                                 selector:@selector(caseInsensitiveCompare:)] ];
    
    NSFetchedResultsController * frcGroups = [[NSFetchedResultsController alloc] initWithFetchRequest:reqGroup
                                                                                 managedObjectContext: [self.fetchedResultsController managedObjectContext]                                                                      sectionNameKeyPath:nil
                                                                                            cacheName:nil ];
    
    // fetch the data y Control de errores
    NSError *err = nil;
    if (![frcGroups performFetch:&err]) {
        NSLog(@"fetch error: %@", err);
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"Error accesing your data"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    //    /*---------------------------------------
    NSArray *fetchedObjects;
    NSError * error = nil;
    fetchedObjects = [[self.fetchedResultsController managedObjectContext] executeFetchRequest:reqGroup error:&error];
    
    if ([fetchedObjects count] == 0) {
        NSLog(@"Registros : %lu", (unsigned long)[fetchedObjects count] );
        UIAlertView *message = [[UIAlertView alloc] initWithTitle: @"Warning !!!"
                                                          message: @"You don´t have any Group, first set up Categories/Groups/Teams"
                                                         delegate: nil
                                                cancelButtonTitle: @"I Know"
                                                otherButtonTitles: nil];
        [message show];
        [self.navigationController popViewControllerAnimated:YES];
    
    }else{
        
        VOSGroup *aGroup = [fetchedObjects objectAtIndex:0];
        
        VOSSelectNewGameViewController * gamesVC = [[VOSSelectNewGameViewController alloc] initForNewGame:aGroup];
        
        [self.navigationController pushViewController:gamesVC
                                             animated:YES];
    }
    
}

#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Averiguar el grupo
    VOSGame * aGame = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos el controlador
    VOSSelectNewGameViewController *updateGameVC = [[VOSSelectNewGameViewController alloc] initWithModel:aGame ];
    
    // lo pusheamos
    [self.navigationController pushViewController:updateGameVC animated:YES];
}


@end
