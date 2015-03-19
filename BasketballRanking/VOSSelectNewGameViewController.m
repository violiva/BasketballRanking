//
//  VOSSelectNewGameViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSSelectNewGameViewController.h"
#import "VOSGroup.h"
#import "VOSGame.h"
#import "VOSTeam.h"
#import "VOSTeam.h"
#import "VOSCategory.h"
#import "VOSClub.h"

#define SELECT_GROUP   0
#define SELECT_LOCAL   1
#define SELECT_VISITOR 2

@interface VOSSelectNewGameViewController ()

@property (strong, nonatomic) NSArray *arrayPicker;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deleteGame;
@property (nonatomic) int  pickerSel;

@end

@implementation VOSSelectNewGameViewController

#pragma mark - Init

-(id) initWithModel:(id) model{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _aGame = model;

        _aGroup = self.aGame.group;
        _aLocalTeam = self.aGame.homeTeam;
        _aVisitorTeam = self.aGame.awayTeam;
    }
    return self;
}

-(id) initForNewGame:(VOSGroup *) group{
    
    VOSGame *game = [VOSGame gameWithGroup:group
                                   context:group.managedObjectContext] ;
    _new = YES;
    _aGroup = group;
    return [self initWithModel:game];
}


-(instancetype)initWithGroup:(VOSGroup *)aGroup{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _aGroup = aGroup;
    }
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayPicker = [[NSArray alloc] initWithObjects:nil]; // Esta referenacia la utilizamos para apuntar al array Seleccionado
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
    self.picker.hidden = YES;
    self.pickerDate.hidden = YES;
    self.toolbar.hidden = YES;
    self.pickerSel = SELECT_GROUP;

    self.aDate = self.aGame.date;
    self.localization.text = self.aGame.localization;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init ];
//    [formatter setDateFormat:@"dd-MM-YYYY" ];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    self.dateText.text = [formatter stringFromDate:self.aDate];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // modelo -> vista
    self.LocalPoints.text = [NSString stringWithFormat:@"%d", self.aGame.pointHomeValue];
    self.VisitorPoints.text = [NSString stringWithFormat:@"%d", self.aGame.pointVisitValue];
    
    if (!self.aGame.date){
        [self.matchDateLbl setTitle:@"Select Date" forState:UIControlStateNormal];
        self.aDate = [NSDate date];
    }else{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        
        NSString *stringFromDate = [formatter stringFromDate:self.aGame.date];
        
        [self.matchDateLbl setTitle:stringFromDate
                           forState:UIControlStateNormal];
    }

    if (!self.aGame.group){
        [self.groupLbl setTitle:@"Select Group" forState:UIControlStateNormal];
    }else{
        [self.groupLbl setTitle:[NSString stringWithFormat:@"%@ - %@", self.aGame.group.category.name, self.aGame.group.name]
                      forState:UIControlStateNormal];
    }
    
    if (!self.aGame.awayTeam){
        [self.visitorTeamLbl setTitle:@"Select Visitor Team" forState:UIControlStateNormal];
    }else{
        [self.visitorTeamLbl setTitle:[NSString stringWithFormat:@"%@ - %@", self.aGame.awayTeam.club.name, self.aGame.awayTeam.name]
                       forState:UIControlStateNormal];
    }
    
    if (!self.aGame.homeTeam){
        [self.localTeamLbl setTitle:@"Select Local Team" forState:UIControlStateNormal];
    }else{
        [self.localTeamLbl setTitle:[NSString stringWithFormat:@"%@ - %@", self.aGame.homeTeam.club.name, self.aGame.homeTeam.name]
                             forState:UIControlStateNormal];
    }

    // Añadimos botones a la barra de navegación
    UIBarButtonItem *edit = nil;
    if (self.new) {
        // Add the cancel button
        edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                             target:self
                                                             action:@selector(delete:)];
    }else{
        // Add the delete button
        edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash
                                                             target:self
                                                             action:@selector(delete:)];
    }
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                          target:self
                                                                          action:@selector(save:)];

    self.navigationItem.rightBarButtonItems = @[ save, edit];
    [self loadPickerWithGroups];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (self.deleteGame) {
        [self.aGame.managedObjectContext deleteObject:self.aGame];
    }else{
        // vista -> modelo
        self.aGame.localization = self.localization.text;
        self.aGame.group = self.aGroup;
        self.aGame.homeTeam = self.aLocalTeam;
        self.aGame.awayTeam = self.aVisitorTeam;
        self.aGame.date = self.aDate;
        self.aGame.pointHome = @([self.LocalPoints.text intValue]);
        self.aGame.pointVisit = @([self.VisitorPoints.text intValue]);

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils
-(void)hideKeyboard:(id) sender{
    [self.view endEditing:YES];
}

#pragma mark - Actions
- (IBAction)matchDateBtn:(id)sender {
    self.pickerDate.hidden = NO;
    self.picker.hidden = YES;
    self.toolbar.hidden = NO;
    
}

- (IBAction)valueChanged:(id)sender{
    self.aDate = [self.pickerDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init ];
    [formatter setDateStyle:NSDateFormatterMediumStyle ];

    self.dateText.text = [formatter stringFromDate:self.aDate];

}

- (IBAction)doneDate:(id)sender {
    self.pickerDate.hidden = YES;
    self.picker.hidden = YES;
    self.toolbar.hidden = YES;
    
}


- (IBAction)groupBtn:(id)sender {
   
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_GROUP;
    self.toolbar.hidden = NO;
    
    [self loadPickerWithGroups];
        
    [self.picker reloadAllComponents];
}

- (IBAction)localTeamBtn:(id)sender {
    
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_LOCAL;
    self.toolbar.hidden = NO;
    
    [self loadPickerTeamsInAGroups];
    
    [self.picker reloadAllComponents];
}

- (IBAction)visitorTeamBtn:(id)sender {
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_VISITOR;
    self.toolbar.hidden = NO;
    
    [self loadPickerTeamsInAGroups];
    
    [self.picker reloadAllComponents];
}

-(void)save:(id)sender {
    self.aGame.localization = self.localization.text;
    self.aGame.date = self.aDate;
    self.aGame.group = self.aGroup;
    self.aGame.homeTeam = self.aLocalTeam;
    self.aGame.awayTeam = self.aVisitorTeam;
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)delete:(id)sender{
    self.deleteGame = YES;
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(void)loadPickerWithGroups{
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSGroup entityName]];
    req.fetchBatchSize = 15;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"category.name"
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)],
                             [NSSortDescriptor sortDescriptorWithKey:VOSGroupAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    NSFetchedResultsController *frcGroup = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:self.aGame.managedObjectContext
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil ];
    
    // fetch the data y Control de errores
    NSError *err = nil;
    if (![frcGroup performFetch:&err]) {
        NSLog(@"fetch error: %@", err);
        abort();
    }
    
    self.arrayPicker = [[NSArray alloc] init];
    self.arrayPicker = [self.aGroup.managedObjectContext executeFetchRequest:req error:&err ];
    
    /*---------------------------------------
     NSArray *fetchedObjects;
     NSError * error = nil;
     fetchedObjects = [self.aGame.managedObjectContext executeFetchRequest:req error:&error];
     
     NSLog(@"Registros : %lu", (unsigned long)[fetchedObjects count] );
     //---------------------------------------*/
    
}

-(void)loadPickerTeamsInAGroups{
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSTeam entityName]];
    req.fetchBatchSize = 15;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:@"club.name"
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)],
                             [NSSortDescriptor sortDescriptorWithKey:VOSTeamAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    
    req.predicate = [NSPredicate predicateWithFormat:@"group CONTAINS[cd] %@", self.aGroup ];
    
    NSFetchedResultsController *frcTeam = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:self.aGroup.managedObjectContext
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil ];
    
    // fetch the data y Control de errores
    NSError *err = nil;
    if (![frcTeam performFetch:&err]) {
        NSLog(@"fetch error: %@", err);
        abort();
    }
    
    self.arrayPicker = [[NSArray alloc] init];
    self.arrayPicker = [self.aGroup.managedObjectContext executeFetchRequest:req error:&err ];
    /*---------------------------------------
     NSArray *fetchedObjects;
     NSError * error = nil;
     fetchedObjects = [self.aGame.managedObjectContext executeFetchRequest:req error:&error];
     
     NSLog(@"Registros : %lu", (unsigned long)[fetchedObjects count] );
     //---------------------------------------*/
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arrayPicker count];
}


#pragma mark - PickerViewDelegate
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSString *groupText = [NSString new];
    
    if ( self.pickerSel == SELECT_GROUP){
        VOSGroup *objectRow = [self.arrayPicker objectAtIndex:row];
        groupText = [NSString stringWithFormat:@"%@ - %@", objectRow.category.name, objectRow.name];
    }else {
        VOSTeam *objectRow = [self.arrayPicker objectAtIndex:row];
        groupText = [NSString stringWithFormat:@"%@ - %@", objectRow.club.name, objectRow.name];
    }
    
    return groupText;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    NSString *groupText = [NSString new];

    if ( self.pickerSel == SELECT_GROUP){

        VOSGroup *objectRow = [self.arrayPicker objectAtIndex:row];
        groupText = [NSString stringWithFormat:@"%@ - %@", objectRow.category.name, objectRow.name];
        [self.groupLbl setTitle:groupText
                       forState:UIControlStateNormal];
        
        self.aGroup = objectRow;
        
        // Cuando se cambia el Grupo quitamos los equipos por si hemos seleccionado un grupo distinto y no tiene esos equipos
        [self.localTeamLbl setTitle:@"Select Local Team"
                           forState:UIControlStateNormal];
        [self.visitorTeamLbl setTitle:@"Select Visitor Team"
                             forState:UIControlStateNormal];
        self.aLocalTeam = nil;
        self.aVisitorTeam = nil;

    }else if (self.pickerSel == SELECT_LOCAL){
        VOSTeam *objectRow = [self.arrayPicker objectAtIndex:row];
        groupText = [NSString stringWithFormat:@"%@ - %@", objectRow.club.name, objectRow.name];
        [self.localTeamLbl setTitle:groupText
                           forState:UIControlStateNormal];
        
        self.aLocalTeam = objectRow;
        
    }else if (self.pickerSel == SELECT_VISITOR){
        VOSTeam *objectRow = [self.arrayPicker objectAtIndex:row];
        groupText = [NSString stringWithFormat:@"%@ - %@", objectRow.club.name, objectRow.name];
        [self.visitorTeamLbl setTitle:groupText
                             forState:UIControlStateNormal];
        
        self.aVisitorTeam = objectRow;
    }
}


@end
