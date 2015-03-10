//
//  VOSTeamsInAGroupViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTeamsInAGroupViewController.h"
#import "VOSGroup.h"
#import "VOSTeam.h"
#import "VOSClub.h"
#import "VOSLogo.h"

@interface VOSTeamsInAGroupViewController ()

@property (strong, nonatomic) NSArray *arrayPicker;
@property (strong, nonatomic) NSMutableDictionary *aTeams;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deleteCouple;

@end

@implementation VOSTeamsInAGroupViewController

#pragma mark - Init
-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           group:(VOSGroup *)group
                                          style:(UITableViewStyle)aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        _aGroup = group;
        self.fetchedResultsController = aFetchedResultsController;
    }
    return self;
    
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickedTeams = [[NSMutableSet alloc] init];
    
    // Retrieve all teams
    NSError *error;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    // Each tag attached to the details is included in the array
    NSSet *teams = self.aGroup.teams;
    
    for (VOSTeam *team in teams) {
        
        [self.pickedTeams addObject:team];
        
    }
    
    // setting up add button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                        target:self
                                                                        action:@selector( addTeam: )];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.title = [NSString stringWithFormat:@"Teams in a Group %@", self.aGroup.name ];
}

// Nuestro controlador implementa ya por sí solo los números de secciones y filas en cada sección,
// pero debemos especificarle que tipo de celda queremos para cada fila recuperada.
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué Equipo se trata
    VOSTeam * team = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // creo una celda
    static NSString * cellId = @"TeamCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryNone;
    if ([self.pickedTeams containsObject:team]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

    cell.imageView.image = team.club.logo.image;
    cell.textLabel.text = team.name ;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", team.colour, team.year];
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    // la devolvemos
    return cell;
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    self.aGroup.teams = self.pickedTeams;

    NSError *error = nil;
    if (![self.aGroup.managedObjectContext save:&error]) {
        NSLog(@"Core data error %@, %@", error, [error userInfo]);
        abort();
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(void) addTeam:(id) sender{
//    UIAlertView *newTagAlert = [[UIAlertView alloc] initWithTitle:@"New tag" message:@"Insert new tag name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    
//    newTagAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
//    [newTagAlert show];
    
}






@end
