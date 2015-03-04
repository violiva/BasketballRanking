//
//  VOSPlayerCollectionViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 27/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPlayerCollectionViewController.h"
#import "VOSPlayer.h"
#import "VOSPlayerCollectionViewCell.h"
#import "VOSPhotoContainer.h"

#import "VOSCoreDataCollectionViewController.h"
#import "VOSTeam.h"
#import "VOSDetailPlayerViewController.h"

// #import "VOSEditPlayerViewController.h"


static NSString *cellID = @"PlayerCellID";

@interface VOSPlayerCollectionViewController () // <NSFetchedResultsControllerDelegate>

@end

@implementation VOSPlayerCollectionViewController

#pragma mark - View Lifecycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self registerNib];
    self.title = @"Players";
    
    // Establecemos en la superclase CoreDataViewController su propiedad detailViewControllerClassName con el nombre
    //      del controlador de detalle al que deberá invocar cuando seleccionemos un elemento de esta clase y queramos
    //      pasar a su detalle. El método del CollectionView: didSelect... está por tanto implementado en la superclase
    //      CoreDataViewCollection
    self.detailViewControllerClassName = NSStringFromClass([VOSDetailPlayerViewController class]);
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.90 alpha:1];
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                         target:self
                                                                         action:@selector(addPlayer:)];

    UIBarButtonItem *addFull = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                         target:self
                                                                         action:@selector(addFullTeam:)];

//    self.navigationItem.rightBarButtonItem = add;

    self.navigationItem.rightBarButtonItems = @[ add, addFull ];

}


#pragma mark - Xib registration
-(void)registerNib{

    UINib *nib = [UINib nibWithNibName:@"VOSPlayerCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:cellID];
    
}


#pragma mark - Data Source
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    // Obtener el jugador
    VOSPlayer *player = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Conseguir una celda
    VOSPlayerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath ];
    
    // Configurar la celda. Sincronizar los datos del modelo con la vista
/*
    cell.photoView.image = player.photo.image;
    cell.nameView.text = player.name;
    cell.dorsalView.text = [NSString stringWithFormat:@"%@", player.dorsal];
*/
    [cell observePlayer:player];
    
    // devolver la celda
    return cell;
}

/*---------------------- lo eliminamos al implementarlo directament en la clase CoreDataCollectionViewController
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    // Obtener el objeto
    VOSPlayer *player = [self.fetchedResultsController objectAtIndexPath:indexPath];

    // Crear el controlador
    VOSDetailPlayerViewController *playerVC = [[VOSDetailPlayerViewController alloc] initWithModel:player];

    // Hacer un push
    [self.navigationController pushViewController:playerVC
                                         animated:YES];
}
--------------------------------------------------------------------------------------------------------------*/


#pragma mark - Actions
-(void) addPlayer:(id) sender{

    // Opción 1
/*------------------------------------------------------------------------------------------------------------------------
    VOSPlayer * player = [VOSPlayer playerWithName:[NSString stringWithFormat:@"New Player from %@ Team", self.team.name]
                                              team:self.team
                                           context:self.fetchedResultsController.managedObjectContext];

    VOSEditPlayerViewController *newPlayerVC = [[VOSEditPlayerViewController alloc] initWithModel:player ];
------------------------------------------------------------------------------------------------------------------------*/

    // Opción 2
// /*------------------------------------------------------------------------------------------------------------------------
    VOSDetailPlayerViewController *newPlayerVC = [[VOSDetailPlayerViewController alloc] initForNewPlayerInTeam:self.team];
// ------------------------------------------------------------------------------------------------------------------------*/
    
    [self.navigationController pushViewController:newPlayerVC
                                         animated:YES];


}

-(void) addFullTeam:(id) sender{

    for (int ind = 0; ind < 15; ind++){
        [VOSPlayer playerWithDorsal:[NSNumber numberWithInt:ind]
                               Name:[NSString stringWithFormat:@"Player %d", ind]
                               team:self.team
                            context:self.fetchedResultsController.managedObjectContext];

    }

}

@end
