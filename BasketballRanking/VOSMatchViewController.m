//
//  VOSMatchViewController.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 20/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSMatchViewController.h"
#import "VOSGame.h"
#import "VOSTeam.h"
#import "VOSClub.h"
#import "VOSCategory.h"
#import "VOSGroup.h"
#import "VOSPlayer.h"
#import "VOSPlayerCollectionViewController.h"
#import "VOSSelectCrewViewController.h"

#define START_TIME    0
#define CONTINUE_TIME 1

@interface VOSMatchViewController ()

@property (nonatomic) int timeContinue;
@property (nonatomic) int timeLeft;

@end

@implementation VOSMatchViewController

#pragma mark - Init
-(id) initWithGame:(VOSGame *)aGame{
    if (self =[super initWithNibName:nil bundle:nil]){
        _aGame = aGame;
    }
    return self;
}

#pragma mark - View´s Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    // inicializamos las etiquetas con datos de equipos y marcador
    self.localTeam.text = [NSString stringWithFormat:@"%@ - %@", self.aGame.homeTeam.club.name, self.aGame.homeTeam.name];
    self.visitorTeam.text = [NSString stringWithFormat:@"%@ - %@", self.aGame.awayTeam.club.name, self.aGame.awayTeam.name];
    self.seconds = self.aGame.group.category.timePeriod.intValue * 60;
    self.timeContinue = START_TIME;

    // establecemos marcador inicial
    self.seconds = self.aGame.group.category.timePeriod.intValue * 60;
    NSInteger secondsT = self.seconds % 60;
    NSInteger minutesT = (self.seconds / 60) % 60;
    NSString *time = [NSString stringWithFormat:@"%.2d:%.2d", minutesT, secondsT ];
    self.secondsLbl.text = time;
    
    // habilitamos botones iniciales
    self.stopBtn.hidden = YES;
    self.pauseBtn.hidden = YES;
    self.restartBtn.hidden = NO;
    self.seconds = self.aGame.group.category.timePeriod.intValue;
    
    // Inicializamos array de quintetos
    self.aLocalPlayerTeam = [[NSMutableArray alloc] initWithCapacity:5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    if (self.aLocalPlayerTeam.count > 0){
        NSLog(@"Jugador 1: %@ Dorsal: %@", [[self.aLocalPlayerTeam objectAtIndex:0] name], [[self.aLocalPlayerTeam objectAtIndex:0] dorsal]);
        NSLog(@"Jugador 2: %@ Dorsal: %@", [[self.aLocalPlayerTeam objectAtIndex:1] name], [[self.aLocalPlayerTeam objectAtIndex:1] dorsal]);
        NSLog(@"Jugador 3: %@ Dorsal: %@", [[self.aLocalPlayerTeam objectAtIndex:2] name], [[self.aLocalPlayerTeam objectAtIndex:2] dorsal]);
        NSLog(@"Jugador 4: %@ Dorsal: %@", [[self.aLocalPlayerTeam objectAtIndex:3] name], [[self.aLocalPlayerTeam objectAtIndex:3] dorsal]);
        NSLog(@"Jugador 5: %@ Dorsal: %@", [[self.aLocalPlayerTeam objectAtIndex:4] name], [[self.aLocalPlayerTeam objectAtIndex:4] dorsal]);
    }
}

#pragma mark - Actions
-(void)startCounter:(NSTimer *) aCounter
{
    self.seconds -= 1 ;
    self.secondsLbl.text = [[NSNumber numberWithInt:self.seconds] stringValue];

    NSInteger secondsT = self.seconds % 60;
    NSInteger minutesT = (self.seconds / 60) % 60;
    NSInteger hoursT = self.seconds / (60 * 60);
    NSString *result = nil;
    if (hoursT > 0) {
        result = [NSString stringWithFormat:@"%.2d:%.2d:%.2d", hoursT, minutesT, secondsT ];
    }
    else {
        result = [NSString stringWithFormat:@"%.2d:%.2d", minutesT, secondsT ];
    }
    self.secondsLbl.text = result;

}

- (void)start:(id)sender{
    self.startBtn.hidden = YES;
    [self.startBtn setTitle:@"Continue" forState:UIControlStateNormal];
    self.pauseBtn.hidden = NO;
    self.stopBtn.hidden = NO;

    if (self.timeContinue == START_TIME) {
        self.seconds = self.aGame.group.category.timePeriod.intValue * 60;
    }else{
        self.seconds = self.timeLeft;
    }
    
    self.counter = [NSTimer scheduledTimerWithTimeInterval:1
                                                     target:self
                                                   selector:@selector(startCounter:)
                                                   userInfo:nil
                                                    repeats:YES];
}

- (void)stop:(id)sender{
    self.startBtn.hidden = NO;
    self.stopBtn.hidden = YES;
    self.restartBtn.hidden = NO;
    self.pauseBtn.hidden = YES;

    [self.counter invalidate];
    self.counter = nil;
    self.seconds = 0;
    self.secondsLbl.text = @"00:00";
    self.timeContinue = 0;
}

- (void)pause:(id)sender{
    self.pauseBtn.hidden = YES;
    self.startBtn.hidden = NO;

    [self.counter invalidate];
    self.counter = nil;
    
    self.timeLeft = self.seconds;
    self.timeContinue = CONTINUE_TIME;
}

- (void)restart:(id)sender{
    self.seconds = self.aGame.group.category.timePeriod.intValue * 60;
    NSInteger secondsT = self.seconds % 60;
    NSInteger minutesT = (self.seconds / 60) % 60;

    NSString *time = [NSString stringWithFormat:@"%.2d:%.2d", minutesT, secondsT ];
    
    self.secondsLbl.text = time;
    self.timeContinue = START_TIME;
}

- (IBAction)editLocalTeam:(id)sender {
    
    VOSTeam * team = self.aGame.homeTeam;
    
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSPlayer entityName]];
    req.fetchBatchSize = 30;
    
    // Asignamos la ordenación por el número de Dorsal para que se vayam ordenando según se vaya modificando.
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSPlayerAttributes.dorsal ascending:YES]];
    
    req.predicate = [NSPredicate predicateWithFormat:@"team == %@", team];
    NSFetchedResultsController * frcTeam = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                               managedObjectContext:self.aGame.managedObjectContext
                                                                                 sectionNameKeyPath:nil
                                                                                          cacheName:nil ];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake(140, 160);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    VOSPlayerCollectionViewController *playerVC = [VOSPlayerCollectionViewController coreDataCollectionViewControllerWithFetchedResultsController:frcTeam
                                                                                                                                           layout:layout];
    playerVC.team = team;
    
    [self.navigationController pushViewController:playerVC
                                         animated:YES];

}

- (IBAction)selectCrew:(id)sender {

    // Seleccionamos el equipo del que tenemos que mostrar los jugadores
    VOSTeam *team = self.aGame.homeTeam;
    
    // Creo la selección de datos
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSPlayer entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSPlayerAttributes.dorsal
                                                           ascending:YES
                                                            selector:nil] ];
    
    req.predicate = [NSPredicate predicateWithFormat:@"team == %@", team];
    
    NSFetchedResultsController * frc = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                           managedObjectContext:self.aGame.managedObjectContext
                                                                             sectionNameKeyPath:nil
                                                                                      cacheName:nil];
    
    // Creamos una instancia de controlador de Seleccioón de alineación del equipo
    VOSSelectCrewViewController *crewVC = [[VOSSelectCrewViewController alloc] initWithFetchedResultsController:frc
                                                                                                           team:team
                                                                                                          aCrew:self.aLocalPlayerTeam
                                                                                                          style:UITableViewStylePlain];
    
    // Lo pusheo
    [self.navigationController pushViewController:crewVC
                                         animated:YES];
    
}


@end
