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
    self.pickerSel = SELECT_GROUP;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // modelo -> vista
    
    if (!self.aGame.date){
        [self.matchDateLbl setTitle:@"Select Date" forState:UIControlStateNormal];
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

    //    [self setupInputAccessoryView];
    
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
    self.navigationItem.rightBarButtonItem = edit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*------- No deja establecer esta propiedad cuando es un boton que es de sólo lectura
#pragma mark -  TextView
-(void) setupInputAccessoryView{
    
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 44)];
    
    // Buttons
    UIBarButtonItem *sep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                         target:nil
                                                                         action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                         target:self
                                                                         action:@selector(hideKeyboard:)];
    
    // añadimos los botones a la barra de navegación creada
    [bar setItems:@[sep, done]];
    
    // asignamos la barra de navegación al campo de texto
    self.groupLbl.inputAccessoryView = bar;
}
*/

#pragma mark - Utils
-(void)hideKeyboard:(id) sender{
    [self.view endEditing:YES];
}

// Metodo para que desaparezca el pickerview cuando pulsas fuera de el
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
    if ( !self.picker.hidden) {
        self.picker.hidden = YES;
    }
    
}


#pragma mark - Actions
- (IBAction)matchDateBtn:(id)sender {
}

- (IBAction)groupBtn:(id)sender {
   
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_GROUP;
    
    [self loadPickerWithGroups];
        
    [self.picker reloadAllComponents];
}

- (IBAction)localTeamBtn:(id)sender {
    
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_LOCAL;
    
    [self loadPickerTeamsInAGroups];
    
    [self.picker reloadAllComponents];
}

- (IBAction)visitorTeamBtn:(id)sender {
    self.picker.hidden = NO;
    self.pickerDate.hidden = YES;
    self.pickerSel = SELECT_VISITOR;
    
    [self loadPickerTeamsInAGroups];
    
    [self.picker reloadAllComponents];
}

- (IBAction)CancelBtn:(id)sender {
    if (self.new) {
        self.deleteGame = YES;
        [self.navigationController popViewControllerAnimated:YES];
    }

}

- (IBAction)doneBtn:(id)sender {
    self.aGame.group = self.aGroup;
    self.aGame.homeTeam = self.aLocalTeam;
    self.aGame.awayTeam = self.aVisitorTeam;
//----    self.aGame.date = self.

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
