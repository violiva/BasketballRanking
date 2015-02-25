//
//  VOSEditPlayerViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 25/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//
#define NUMBER_OF_SECTIONS     3
#define NAME_SECTION_HEADER    @"Player Name"
#define DORSAL_SECTION_HEADER  @"Dorsal"
#define PHOTO_SECTION_HEADER   @"Photo"
#define NAME_SECTION           0
#define DORSAL_SECTION         1
#define PHOTO_SECTION          2


#import "VOSEditPlayerViewController.h"

#import "VOSPlayer.h"

#import "VOSPlayerNameTableViewCell.h"
#import "VOSPlayerDorsalTableViewCell.h"
#import "VOSPlayerPhotoTableViewCell.h"
#import "VOSPhotoViewController.h"
#import "VOSPhotoContainer.h"
#import "VOSPhotoContainer.h"


@interface VOSEditPlayerViewController ()

@end

@implementation VOSEditPlayerViewController

-(id) initWithModel:(VOSPlayer *) model{
    if (self =[super initWithNibName:nil bundle:nil]){
        _player = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECTION:
            return NAME_SECTION_HEADER;
            break;
            
        case DORSAL_SECTION:
            return DORSAL_SECTION_HEADER;
            break;
            
        case PHOTO_SECTION:
            return PHOTO_SECTION_HEADER;
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
            VOSPlayerNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSPlayerNameTableViewCell cellId] forIndexPath:indexPath];
            [cell setPlayer:self.player];
            cell.namePlayerView.delegate = cell;
            return cell;
            break;}
            
        case DORSAL_SECTION:{
            VOSPlayerDorsalTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSPlayerDorsalTableViewCell cellId] forIndexPath:indexPath];
            [cell setPlayer:self.player];
            cell.dorsalView.delegate = cell;
            return cell;
            break;}
            
        case PHOTO_SECTION:{
            VOSPlayerPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[VOSPlayerPhotoTableViewCell cellId] forIndexPath:indexPath];
            [cell setPlayer:self.player];
            return cell;
            break;}
            
        default:
            [NSException raise:@"UnkownSection"
                        format:@"Unknown section %ld",(long)indexPath.section];
            return nil;
            break;
    }
}


-(CGFloat) tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECTION:
            return [VOSPlayerNameTableViewCell height];
            break;
            
        case DORSAL_SECTION:
            return [VOSPlayerDorsalTableViewCell height];
            break;
            
        case PHOTO_SECTION:
            return [VOSPlayerPhotoTableViewCell height];
            break;
            
        default:
            return 0;
            break;
    }
}

-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"VOSPlayerNameTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[VOSPlayerNameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"VOSPlayerDorsalTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[VOSPlayerDorsalTableViewCell  cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"VOSPlayerPhotoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[VOSPlayerPhotoTableViewCell cellId]];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == PHOTO_SECTION) {
        
        // Mostramos el controlador de Fotos
        if ( self.player.photo == nil ){
            self.player.photo = [[VOSPhotoContainer alloc] photoWithImage:nil
                                                    context:self.player.managedObjectContext];
        }
        
        VOSPhotoViewController *pVC = [[VOSPhotoViewController alloc] initWithModel:self.player];
        
        [self.navigationController pushViewController:pVC
                                             animated:YES];
    }
}

@end
