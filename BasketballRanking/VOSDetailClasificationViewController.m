//
//  VOSDetailClasificationViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 4/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSDetailClasificationViewController.h"
#import "VOSClasification.h"
#import "VOSGroup.h"
#import "VOSTeam.h"

@interface VOSDetailClasificationViewController ()
{
    NSFetchedResultsController *frcTeam;
}

@property (strong, nonatomic) NSArray *arrayPicker;
@property (strong, nonatomic) NSMutableDictionary *aTeams;
@property (nonatomic) BOOL new;
@property (nonatomic) BOOL deleteClasification;
@property (nonatomic, strong) VOSGroup * aGroup;

@end

@implementation VOSDetailClasificationViewController

#pragma mark - Init
-(id) initWithModel:(id) model{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _clasif = model;
    }
    return self;
}

-(id) initForNewClasificationInGroup: (VOSGroup *) group{
    VOSClasification *clas = [VOSClasification clasificiationWithGroup:group
                                                               context:group.managedObjectContext] ;
    
    _new = YES;
    _aGroup = group;
    return [self initWithModel:clas];
}

#pragma mark - Actions
- (IBAction)setTeam:(id)sender {
    self.pickerTeam.hidden = NO;
    [self loadPickerWithTeamsFromGroup];
    [self.pickerTeam reloadAllComponents];

}

-(void)delete:(id)sender{
    self.deleteClasification = YES;
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - View Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayPicker = [[NSArray alloc] initWithObjects:nil]; // Esta referenacia la utilizamos para apuntar al array Seleccionado
    
    self.pickerTeam.delegate = self;
    self.pickerTeam.dataSource = self;
    self.pickerTeam.hidden = YES;
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // modelo -> vista
    
    self.groupLbl.text = self.clasif.group.name;
    self.gPlayed.text = [NSString stringWithFormat:@"%@", self.clasif.gamesPlayed];
    self.gWon.text = [NSString stringWithFormat:@"%@", self.clasif.gamesWon];
    self.gTied.text = [NSString stringWithFormat:@"%@", self.clasif.gamesTied];
    self.gLost.text = [NSString stringWithFormat:@"%@", self.clasif.gamesLost];
    self.pForUs.text = [NSString stringWithFormat:@"%@", self.clasif.pointsForUs];
    self.pAgainst.text = [NSString stringWithFormat:@"%@", self.clasif.pointsAgainst];
    self.pTotal.text = [NSString stringWithFormat:@"%@", self.clasif.totalPoints];
    self.pDif.text = [NSString stringWithFormat:@"%@", self.clasif.dif];
    
    [self.btnTeam setTitle:@"Select Team" forState:UIControlStateNormal];
    
    [self startObservingKeyboard];
    [self setupInputAccessoryView];
    
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
    
    // delegados
    self.gPlayed.delegate = self;
    self.gWon.delegate = self;
    self.gTied.delegate = self;
    self.gLost.delegate = self;
    self.pForUs.delegate = self;
    self.pAgainst.delegate = self;
    self.pTotal.delegate = self;
    self.pDif.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if (self.deleteClasification) {
        [self.clasif.managedObjectContext deleteObject:self.clasif];
    }else{
        // vista -> modelo
        self.clasif.gamesPlayed = @([self.gPlayed.text intValue]);
        self.clasif.gamesWon = @([self.gWon.text intValue]);
        self.clasif.gamesTied = @([self.gTied.text intValue]);
        self.clasif.gamesLost = @([self.gLost.text intValue]);
        self.clasif.pointsForUs = @([self.pForUs.text intValue]);
        self.clasif.pointsAgainst = @([self.pAgainst.text intValue]);
        self.clasif.totalPoints = @([self.pTotal.text intValue]);
        self.clasif.dif = @([self.pDif.text intValue]);

        //  REVISAR PARA SACAR EL VALOR DEL TEAM DEL NSDICTIONARY
        self.clasif.team = [self.aTeams objectForKey:self.teamText.text];
    }
    [self stopObservingKeyboard];
}

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
    self.gPlayed.inputAccessoryView = bar;
    self.gWon.inputAccessoryView = bar;
    self.gTied.inputAccessoryView = bar;
    self.gLost.inputAccessoryView = bar;
    self.pForUs.inputAccessoryView = bar;
    self.pAgainst.inputAccessoryView = bar;
    self.pTotal.inputAccessoryView = bar;
    self.pDif.inputAccessoryView = bar;
}


#pragma mark - Keyboard
-(void) startObservingKeyboard{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillAppear:)
               name:UIKeyboardWillShowNotification
             object:nil];
    [nc addObserver:self
           selector:@selector(notifyThatKeyboardWillDisappear:)
               name:UIKeyboardWillHideNotification
             object:nil];
}

-(void) stopObservingKeyboard{
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}

-(void)notifyThatKeyboardWillAppear:(NSNotification *)notification{
/*
    // extraer el userInfo con la información auxiliar de la notificación.
    NSDictionary *dict = notification.userInfo;
    
    // Extraer la duración de la animación
    double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.9
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         // Cambiar el CGFrame moviendo la caja de texto para arriba
                         self.dorsalView.frame = CGRectMake(self.playerNameView.frame.origin.x,
                                                            self.playerNameView.frame.origin.y,
                                                            self.dorsalView.frame.size.width,
                                                            self.dorsalView.frame.size.height );
                     }
                     completion:nil];
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.dorsalView.alpha = 0.8;
                     }];
*/
}

-(void)notifyThatKeyboardWillDisappear:(NSNotification *)notification{
/*
    // extraer el userInfo con la información auxiliar de la notificación.
    NSDictionary *dict = notification.userInfo;
    
    // Extraer la duración de la animación
    double duration = [[dict objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // Cambiar las propiedades de la caja de texto
    [UIView animateWithDuration:duration
                          delay:0
                        options:0
                     animations:^{
                         // Cambiar el CGFrame moviendo la caja de texto para arriba
                         self.dorsalView.frame = CGRectMake(166,
                                                            219,
                                                            self.dorsalView.frame.size.width,
                                                            self.dorsalView.frame.size.height );
                         
                     } completion:nil];
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.dorsalView.alpha = 1;
                     }];
*/
}

-(void)hideKeyboard:(id) sender{
    [self.view endEditing:YES];

    self.pickerTeam.hidden = NO;
    
    // esta llamada no pasa por el método shouldReturn directamente va al didEndEditing.
    // validateValue:forKey:Error: son métodos de NSManagedObject y sería ahí donde habría que implementar los métodos de validación.
}


#pragma mark - PickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(void)loadPickerWithTeamsFromGroup{
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSTeam entityName]];
    req.fetchBatchSize = 15;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSTeamAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    
    req.predicate = [NSPredicate predicateWithFormat:@"group == %@", self.aGroup ];

    frcTeam = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                  managedObjectContext:self.clasif.managedObjectContext
                                                    sectionNameKeyPath:nil
                                                             cacheName:nil ];

    // fetch the data y Control de errores
    NSError *err = nil;
    if (![frcTeam performFetch:&err]) {
        NSLog(@"fetch error: %@", err);
        abort();
    }
    
    self.arrayPicker = [[NSArray alloc] init];
    self.aTeams = [[NSMutableDictionary alloc] init];
    self.arrayPicker = [self.aGroup.managedObjectContext executeFetchRequest:req error:&err ];
    
    for (VOSTeam *team in self.arrayPicker) {
        NSLog(@"Equipo: %@", team.name);
        [self.aTeams setObject:team
                     forKey:team.name];

    }

    
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [self.arrayPicker count];
}


#pragma mark - PickerViewDelegate
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [[self.arrayPicker objectAtIndex:row] name];
}

/*
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//-------------------------
    NSManagedObject *team = [[[self fetchedResultsController] fetchedObjects] objectAtIndex:row];
    NSString *name = (NSString *)[gym valueForKey:@"name"];
    return name;
//-------------------------
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSTeam entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSTeamAttributes.name
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    
    req.predicate = [NSPredicate predicateWithFormat:@"group == %@", self.aGroup ];
    frcTeam = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                  managedObjectContext:self.aGroup.managedObjectContext
                                                    sectionNameKeyPath:nil
                                                             cacheName:nil ];

    NSManagedObject *team = [[frcTeam fetchedObjects] objectAtIndex:row];
    NSString *name = (NSString *)[team valueForKey:@"name"];
    return name;
}
*/


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
        self.teamText.text = [[self.arrayPicker objectAtIndex:row] name];
        [self.btnTeam setTitle:[[self.arrayPicker objectAtIndex:row] name] forState:UIControlStateNormal];
}


// Metodo para que desaparezca el pickerview cuando pulsas fuera de el
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
    if ( !self.pickerTeam.hidden) {
        self.pickerTeam.hidden = YES;
    }
    
}


@end
