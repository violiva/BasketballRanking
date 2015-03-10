//
//  VOSTeamsListViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTeamsListViewController.h"
#import "VOSGroup.h"
#import "VOSTeam.h"
#import "VOSClub.h"

@interface VOSTeamsListViewController ()

@end

@implementation VOSTeamsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"Grupo: %@", self.group.name);
    
    self.pickedTeams = [[NSMutableSet alloc] init];
    
    // Retrieve all Teams
    NSError *error;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    // Each team attached to the group is included in the array
    NSSet *teams = self.group.teams;
    
    for (VOSTeam *team in teams) {
        [self.pickedTeams addObject:team];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    self.group.teams = self.pickedTeams;
    
    NSError *error = nil;
    if (![self.group.managedObjectContext save:&error]) {
        NSLog(@"Core data error %@, %@", error, [error userInfo]);
        abort();
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar el equipo
    VOSTeam * tm = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"teamCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryNone;
    if ([self.pickedTeams containsObject:tm]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ / %@", tm.club.name, tm.name ];
    cell.textLabel.text = tm.name;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    
    // la devolvemos
    return cell;
}


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    VOSTeam * tm = [self.fetchedResultsController objectAtIndexPath:indexPath];

    UITableViewCell * cell = [self.tableView  cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    
    if ([self.pickedTeams containsObject:tm]) {
        
        [self.pickedTeams removeObject:tm];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    } else {
        
        [self.pickedTeams addObject:tm];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
    }
}




@end
