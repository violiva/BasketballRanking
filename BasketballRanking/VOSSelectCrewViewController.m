//
//  VOSSelectCrewViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSSelectCrewViewController.h"
#import "VOSTeam.h"
#import "VOSPlayer.h"
#import "VOSPhotoContainer.h"

@interface VOSSelectCrewViewController ()

@end

@implementation VOSSelectCrewViewController

#pragma mark - Init
-(id) initWithFetchedResultsController: (NSFetchedResultsController *) aFetchedResultsController
                                  team:aTeam
                                 aCrew:aCrew
                                 style: (UITableViewStyle) aStyle{
    
    if (self = [super initWithStyle:aStyle]) {
        self.fetchedResultsController = aFetchedResultsController;
        _pickedCrew = aCrew;
        _team = aTeam;
    }
    return self;
}


#pragma mark - Views Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguamos de qué jugador se trata
    VOSPlayer * player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Creamos la celda
    static NSString * cellId = @"playerCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    // la configuramos
    cell.accessoryType = UITableViewCellAccessoryNone;
    if ([self.pickedCrew containsObject:player]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.imageView.image = player.photo.image;
    cell.textLabel.font = [UIFont fontWithName:@"Dosis Book" size:20];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ / %@", player.dorsal, player.name];
    
    // la devolvemos
    return cell;
}


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VOSPlayer * player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    UITableViewCell * cell = [self.tableView  cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    
    if ([self.pickedCrew containsObject:player]) {
        
        [self.pickedCrew removeObject:player];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    } else {
        // Sólo permitimos seleccionar jugadores si no tenemos los 5.
        // En caso de tener seleccionados ya los 5 jugadores y querer cambiar alguno,
        //    primero deberá desmarcar uno de ellos para poder marcar uno nuevo
        if ( self.pickedCrew.count <= 4 ){
            [self.pickedCrew addObject:player];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }
    }
}

@end
