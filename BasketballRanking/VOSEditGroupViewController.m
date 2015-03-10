//
//  VOSEditGroupViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//
#define NUMBER_OF_SECTIONS 3
#define NAME_SECTION_HEADER @"Group/Phase Name"
#define YEAR_SECTION_HEADER @"Year"
#define TEAMS_SECTION_HEADER @"Teams"
#define NAME_SECTION  0
#define YEAR_SECTION  1
#define TEAMS_SECTION 2

#import "VOSEditGroupViewController.h"
#import "VOSGroup.h"
#import "VOSGroupTableViewCell.h"
#import "VOSYearOfGroupTableViewCell.h"
#import "VOSYearSelectionViewController.h"
#import "VOSTeamsInAGroupTableViewCell.h"
#import "VOSTeam.h"
#import "VOSClub.h"
#import "VOSTeamsListViewController.h"

@interface VOSEditGroupViewController ()

@end

@implementation VOSEditGroupViewController

-(id) initWithModel:(VOSGroup *) model{
    if (self =[super initWithNibName:nil bundle:nil]){
        _group = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *clearGrey = [UIColor colorWithRed:227.0/255.0
                                         green:227.0/255.0
                                          blue:227.0/222.0
                                         alpha:1];
    [[UITableViewHeaderFooterView appearance] setTintColor:clearGrey];

    [self registerNibs];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
            
        case YEAR_SECTION:
            return YEAR_SECTION_HEADER;
            break;

        case TEAMS_SECTION:
            return TEAMS_SECTION_HEADER;
            break;
            
        default:
            [NSException raise:@"Section do not exist" format:nil];
            return @"Section not exist";
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué celda nos habla
    switch (indexPath.section) {
        case NAME_SECTION:{
            VOSGroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSGroupTableViewCell cellId] forIndexPath:indexPath];
            [cell setGroup:self.group];
            cell.groupNameView.delegate = cell;
            return cell;
            break;}
            
        case YEAR_SECTION:{
            VOSYearOfGroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSYearOfGroupTableViewCell cellId] forIndexPath:indexPath];
            [cell setGroup:self.group];
            cell.yearView.delegate = cell;
            return cell;
            break;}
            
        case TEAMS_SECTION:{
            VOSTeamsInAGroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSTeamsInAGroupTableViewCell cellId] forIndexPath:indexPath];
            [cell setGroup:self.group];
            
            // setting interaction on teams label
            cell.userInteractionEnabled = YES;
            cell.backgroundColor = [UIColor lightGrayColor];

            UITapGestureRecognizer *teamsTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                                action:@selector(teamsTapped)];
            [cell addGestureRecognizer:teamsTapRecognizer];

            return cell;
            break;}
            
        default:
            [NSException raise:@"UnkownSection"
                        format:@"Unknown section %ld",(long)indexPath.section];
            return nil;
            break;
    }
}



-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [VOSGroupTableViewCell height];
            break;
            
        case YEAR_SECTION:
            return [VOSYearOfGroupTableViewCell height];
            break;
            
        case TEAMS_SECTION:
            return [VOSTeamsInAGroupTableViewCell height];
            break;
            
        default:
            return 0;
            break;
    }
}

-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"VOSGroupTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[VOSGroupTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"VOSYearOfGroupTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[VOSYearOfGroupTableViewCell  cellId]];
    
    UINib *teamsNib = [UINib nibWithNibName:@"VOSTeamsInAGroupTableViewCell" bundle:main];
    [self.tableView registerNib:teamsNib forCellReuseIdentifier:[VOSTeamsInAGroupTableViewCell  cellId]];
    
}

-(void)teamsTapped{
    
    // Creamos la selección de equipos a mostrar en la siguiente ventana para seleccionar los que son de este grupo
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSTeam entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"club.name"
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)],
                             [NSSortDescriptor sortDescriptorWithKey:VOSTeamAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    NSFetchedResultsController * frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                           managedObjectContext:self.group.managedObjectContext
                                                                             sectionNameKeyPath:@"club.name"
                                                                                      cacheName:nil];
    
    // Creamos una instancia del controlador que muestra el listado de Equipos
    VOSTeamsListViewController * listTeamVC = [[VOSTeamsListViewController alloc] initWithFetchedResultsController:frc
                                                                                                 style:UITableViewStylePlain];
    
    // Le asignamos su grupo para que se pueda actualizar con los equipos seleccionados
    listTeamVC.group = self.group;
    
    // Lo pusheo
    [self.navigationController pushViewController:listTeamVC
                                         animated:YES];
}

@end
