//
//  VOSEditClubViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//
#define NUMBER_OF_SECTIONS 3
#define NAME_SECTION_HEADER @"Club Name"
#define ADDRESS_SECTION_HEADER @"Address"
#define PHOTO_SECTION_HEADER @"Photo"
#define NAME_SECTION    0
#define ADDRESS_SECTION 1
#define PHOTO_SECTION   2


#import "VOSEditClubViewController.h"

#import "VOSClub.h"

#import "VOSClubNameTableViewCell.h"
#import "VOSClubDirectionTableViewCell.h"
#import "VOSClubLogoTableViewCell.h"
#import "VOSLogoViewController.h"
#import "VOSLogo.h"


@interface VOSEditClubViewController ()

@end

@implementation VOSEditClubViewController

-(id) initWithModel:(VOSClub *) model{
    if (self =[super initWithNibName:nil bundle:nil]){
        _club = model;
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
            
        case ADDRESS_SECTION:
            return ADDRESS_SECTION_HEADER;
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
            VOSClubNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSClubNameTableViewCell cellId] forIndexPath:indexPath];
            [cell setClub:self.club];
            cell.nameField.delegate = cell;
            return cell;
            break;}
            
        case ADDRESS_SECTION:{
            VOSClubDirectionTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:[VOSClubDirectionTableViewCell cellId] forIndexPath:indexPath];
            [cell setClub:self.club];
            cell.addressField.delegate = cell;
            return cell;
            break;}
            
        case PHOTO_SECTION:{
            VOSClubLogoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[VOSClubLogoTableViewCell cellId] forIndexPath:indexPath];
            [cell setClub:self.club];
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
            return [VOSClubNameTableViewCell height];
            break;
            
        case ADDRESS_SECTION:
            return [VOSClubDirectionTableViewCell height];
            break;

        case PHOTO_SECTION:
            return [VOSClubLogoTableViewCell height];
            break;
            
        default:
            return 0;
            break;
    }
}

-(void) registerNibs{
    
    NSBundle *main = [NSBundle mainBundle];
    
    UINib *nameNib = [UINib nibWithNibName:@"VOSClubNameTableViewCell" bundle:main];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[VOSClubNameTableViewCell cellId]];
    
    UINib *datesNib = [UINib nibWithNibName:@"VOSClubDirectionTableViewCell" bundle:main];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[VOSClubDirectionTableViewCell  cellId]];
    
    UINib *photoNib = [UINib nibWithNibName:@"VOSClubLogoTableViewCell" bundle:main];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[VOSClubLogoTableViewCell cellId]];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == PHOTO_SECTION) {
    
        // Mostramos el controlador de Fotos
        if ( self.club.logo == nil ){
            self.club.logo = [[VOSLogo alloc] logoWithImage:nil
                                                    context:self.club.managedObjectContext];
        }
        
        VOSLogoViewController *pVC = [[VOSLogoViewController alloc] initWithModel:self.club];
    
        [self.navigationController pushViewController:pVC
                                             animated:YES];
    }
}

@end
