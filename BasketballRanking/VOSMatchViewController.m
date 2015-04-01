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
#import "VOSPhotoContainer.h"
#import "VOSStatistic.h"
#import "VOSAction.h"
#import "VOSStatisticsViewController.h"
#import "CafPlayer.h"

#define START_TIME      0
#define CONTINUE_TIME   1
#define LOCAL_TEAM      0
#define VISITOR_TEAM    1
#define NO_SELECT_TEAM  2


@interface VOSMatchViewController ()

@property (nonatomic) int timeContinue;
@property (nonatomic) int timeLeft;
@property (nonatomic, strong) NSMutableDictionary *sounds;

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
    NSString *time = [NSString stringWithFormat:@"%.2ld:%.2ld", (long)minutesT, (long)secondsT ];
    self.secondsLbl.text = time;
    self.game.text = @"1";
    self.localPoints.text = [NSString stringWithFormat:@"%@", self.aGame.pointHome];
    self.visitorPoints.text = [NSString stringWithFormat:@"%@", self.aGame.pointVisit];
    self.localFoul.text = @"0";
    self.visitorFoul.text = @"0";

    
    // habilitamos botones iniciales
    self.stopBtn.hidden = YES;
    self.pauseBtn.hidden = YES;
    self.restartBtn.hidden = NO;
    self.seconds = self.aGame.group.category.timePeriod.intValue;
    
    // Inicializamos array de quintetos
    self.aLocalPlayerTeam = [[NSMutableArray alloc] initWithCapacity:5];
    self.aVisitorPlayerTeam = [[NSMutableArray alloc] initWithCapacity:5];

    // Para que no aparezca ningún equipo seleccionado y que al pulsar los botones no puede asignar acción mientras que no
    //  tengamos equipo seleccionado
    self.teamSelected = NO_SELECT_TEAM;
    
    // inicializamos diccionario de sonidos
    self.sounds = [NSMutableDictionary dictionary];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *sound1URL = [bundle URLForResource:@"Canasta"
                                withExtension:@"wav"];
    NSData *data1Sound = [NSData dataWithContentsOfURL:sound1URL];

    NSURL *sound2URL = [bundle URLForResource:@"Canasta2"
                               withExtension:@"wav"];
    NSData *data2Sound = [NSData dataWithContentsOfURL:sound2URL];

    NSURL *sound3URL = [bundle URLForResource:@"Canasta3"
                                withExtension:@"wav"];
    NSData *data3Sound = [NSData dataWithContentsOfURL:sound3URL];

    [self.sounds setObject:@[data1Sound, data2Sound, data3Sound] forKey:@"canasta"];

    NSURL *sound4URL = [bundle URLForResource:@"Bote"
                                withExtension:@"wav"];
    NSData *data4Sound = [NSData dataWithContentsOfURL:sound4URL];

    NSURL *sound5URL = [bundle URLForResource:@"Rebote"
                                withExtension:@"wav"];
    NSData *data5Sound = [NSData dataWithContentsOfURL:sound5URL];

    [self.sounds setObject:@[data4Sound, data5Sound] forKey:@"rebote"];

    NSURL *sound6URL = [bundle URLForResource:@"MiAlarma"
                                withExtension:@"aiff"];
    NSData *data6Sound = [NSData dataWithContentsOfURL:sound6URL];
    
    [self.sounds setObject:@[data6Sound] forKey:@"alarma"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{

    self.localPoints.text = [NSString stringWithFormat:@"%@", self.aGame.pointHome];
    self.visitorPoints.text = [NSString stringWithFormat:@"%@", self.aGame.pointVisit];
    self.teamSelected = NO_SELECT_TEAM;

    self.player1.hidden = YES;
    self.player2.hidden = YES;
    self.player3.hidden = YES;
    self.player4.hidden = YES;
    self.player5.hidden = YES;

    self.playerV1.hidden = YES;
    self.playerV2.hidden = YES;
    self.playerV3.hidden = YES;
    self.playerV4.hidden = YES;
    self.playerV5.hidden = YES;
    
    if (self.aLocalPlayerTeam.count > 0){
        int numPlayers = self.aLocalPlayerTeam.count;
        
        if (numPlayers > 0){
            self.player1.hidden = NO;
            self.photoPlayer1.image = [[[self.aLocalPlayerTeam objectAtIndex:0] photo] image];
            self.dorsalPlayer1.text = [NSString stringWithFormat:@"%@",[[self.aLocalPlayerTeam objectAtIndex:0] dorsal]];
            self.namePlayer1.text = [[self.aLocalPlayerTeam objectAtIndex:0] name];
            self.ballPlayer1.hidden = YES;
        }
        if (numPlayers > 1){
            self.player2.hidden = NO;
            self.photoPlayer2.image = [[[self.aLocalPlayerTeam objectAtIndex:1] photo] image];
            self.dorsalPlayer2.text = [NSString stringWithFormat:@"%@",[[self.aLocalPlayerTeam objectAtIndex:1] dorsal]];
            self.namePlayer2.text = [[self.aLocalPlayerTeam objectAtIndex:1] name];
            self.ballPlayer2.hidden = YES;
        }
        if (numPlayers > 2){
            self.player3.hidden = NO;
            self.photoPlayer3.image = [[[self.aLocalPlayerTeam objectAtIndex:2] photo] image];
            self.dorsalPlayer3.text = [NSString stringWithFormat:@"%@",[[self.aLocalPlayerTeam objectAtIndex:2] dorsal]];
            self.namePlayer3.text = [[self.aLocalPlayerTeam objectAtIndex:2] name];
            self.ballPlayer3.hidden = YES;
        }
        if (numPlayers > 3){
            self.player4.hidden = NO;
            self.photoPlayer4.image = [[[self.aLocalPlayerTeam objectAtIndex:3] photo] image];
            self.dorsalPlayer4.text = [NSString stringWithFormat:@"%@",[[self.aLocalPlayerTeam objectAtIndex:3] dorsal]];
            self.namePlayer4.text = [[self.aLocalPlayerTeam objectAtIndex:3] name];
            self.ballPlayer4.hidden = YES;
        }
        if (numPlayers > 4){
            self.player5.hidden = NO;
            self.photoPlayer5.image = [[[self.aLocalPlayerTeam objectAtIndex:4] photo] image];
            self.dorsalPlayer5.text = [NSString stringWithFormat:@"%@",[[self.aLocalPlayerTeam objectAtIndex:4] dorsal]];
            self.namePlayer5.text = [[self.aLocalPlayerTeam objectAtIndex:4] name];
            self.ballPlayer5.hidden = YES;
        }
        
    }
    
    if (self.aVisitorPlayerTeam.count > 0){
        int numPlayers = self.aVisitorPlayerTeam.count;
        
        if (numPlayers > 0){
            self.playerV1.hidden = NO;
            self.photoPlayerV1.image = [[[self.aVisitorPlayerTeam objectAtIndex:0] photo] image];
            self.dorsalPlayerV1.text = [NSString stringWithFormat:@"%@",[[self.aVisitorPlayerTeam objectAtIndex:0] dorsal]];
            self.namePlayerV1.text = [[self.aVisitorPlayerTeam objectAtIndex:0] name];
            self.ballPlayerV1.hidden = YES;
        }
        if (numPlayers > 1){
            self.playerV2.hidden = NO;
            self.photoPlayerV2.image = [[[self.aVisitorPlayerTeam objectAtIndex:1] photo] image];
            self.dorsalPlayerV2.text = [NSString stringWithFormat:@"%@",[[self.aVisitorPlayerTeam objectAtIndex:1] dorsal]];
            self.namePlayerV2.text = [[self.aVisitorPlayerTeam objectAtIndex:1] name];
            self.ballPlayerV2.hidden = YES;
        }
        if (numPlayers > 2){
            self.playerV3.hidden = NO;
            self.photoPlayerV3.image = [[[self.aVisitorPlayerTeam objectAtIndex:2] photo] image];
            self.dorsalPlayerV3.text = [NSString stringWithFormat:@"%@",[[self.aVisitorPlayerTeam objectAtIndex:2] dorsal]];
            self.namePlayerV3.text = [[self.aVisitorPlayerTeam objectAtIndex:2] name];
            self.ballPlayerV3.hidden = YES;
        }
        if (numPlayers > 3){
            self.playerV4.hidden = NO;
            self.photoPlayerV4.image = [[[self.aVisitorPlayerTeam objectAtIndex:3] photo] image];
            self.dorsalPlayerV4.text = [NSString stringWithFormat:@"%@",[[self.aVisitorPlayerTeam objectAtIndex:3] dorsal]];
            self.namePlayerV4.text = [[self.aVisitorPlayerTeam objectAtIndex:3] name];
            self.ballPlayerV4.hidden = YES;
        }
        if (numPlayers > 4){
            self.playerV5.hidden = NO;
            self.photoPlayerV5.image = [[[self.aVisitorPlayerTeam objectAtIndex:4] photo] image];
            self.dorsalPlayerV5.text = [NSString stringWithFormat:@"%@",[[self.aVisitorPlayerTeam objectAtIndex:4] dorsal]];
            self.namePlayerV5.text = [[self.aVisitorPlayerTeam objectAtIndex:4] name];
            self.ballPlayerV5.hidden = YES;
        }
    }
    
}

-(void) viewWillDisappear:(BOOL)animated{
    self.aGame.pointHome = @([self.localPoints.text intValue]);
    self.aGame.pointVisit = @([self.visitorPoints.text intValue]);
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
        result = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", (long)hoursT, (long)minutesT, (long)secondsT ];
    }
    else {
        result = [NSString stringWithFormat:@"%.2ld:%.2ld", (long)minutesT, (long)secondsT ];
    }
    self.secondsLbl.text = result;
    if (self.seconds == 0){
        self.startBtn.hidden = NO;
        self.stopBtn.hidden = YES;
        self.restartBtn.hidden = NO;
        self.pauseBtn.hidden = YES;
        
        [self.counter invalidate];
        self.counter = nil;
        self.timeContinue = 0;
        
        self.player = [CafPlayer cafPlayer];
        NSArray *sounds = [self.sounds objectForKey:@"alarma"];
        NSData *dataSound = [sounds objectAtIndex:0];
        
        [self.player playSoundData:dataSound];

    }

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

    NSString *time = [NSString stringWithFormat:@"%.2ld:%.2ld", (long)minutesT, (long)secondsT ];
    
    self.secondsLbl.text = time;
    self.timeContinue = START_TIME;
}

-(IBAction)gameChanged:(id)sender{
    UIStepper *stepper = (UIStepper *) sender;
    stepper.maximumValue = self.aGame.group.category.period.intValue;
    stepper.minimumValue = 1;

    self.game.text = [NSString stringWithFormat:@"%d",
                      [[NSNumber numberWithDouble:[(UIStepper *)sender value]] intValue ]];

    // Si se cambia el tiempo de juego ( cuarto o sexto o lo que sea ) hay que resetear el reloj también
    self.seconds = self.aGame.group.category.timePeriod.intValue * 60;
    NSInteger secondsT = self.seconds % 60;
    NSInteger minutesT = (self.seconds / 60) % 60;
    
    NSString *time = [NSString stringWithFormat:@"%.2ld:%.2ld", (long)minutesT, (long)secondsT ];
    
    self.secondsLbl.text = time;
    self.timeContinue = START_TIME;
    
    // reiniciamos contadores de faltas
    [self.localFoulStepper setValue:0];
    [self.visitorFoulStepper setValue:0];
    self.localFoul.text = @"0";
    self.visitorFoul.text = @"0";
}

-(IBAction)localFoulChanged:(id)sender{
    self.localFoul.text = [NSString stringWithFormat:@"%d",
                      [[NSNumber numberWithDouble:[(UIStepper *)sender value]] intValue ]];
    
}

-(IBAction)visitorFoulChanged:(id)sender{
    self.visitorFoul.text = [NSString stringWithFormat:@"%d",
                           [[NSNumber numberWithDouble:[(UIStepper *)sender value]] intValue ]];
    
}


-(void)hiddenBalls{
    self.ballPlayer1.hidden = YES;
    self.ballPlayer2.hidden = YES;
    self.ballPlayer3.hidden = YES;
    self.ballPlayer4.hidden = YES;
    self.ballPlayer5.hidden = YES;

    self.ballPlayerV1.hidden = YES;
    self.ballPlayerV2.hidden = YES;
    self.ballPlayerV3.hidden = YES;
    self.ballPlayerV4.hidden = YES;
    self.ballPlayerV5.hidden = YES;
    
}

- (IBAction)selectPlayer1:(id)sender {
    [self hiddenBalls];
    self.ballPlayer1.hidden = NO;
    self.playerSelected = [self.aLocalPlayerTeam objectAtIndex:0];
    self.teamSelected = LOCAL_TEAM;
}

- (IBAction)selectPlayer2:(id)sender {
    [self hiddenBalls];
    self.ballPlayer2.hidden = NO;
    self.playerSelected = [self.aLocalPlayerTeam objectAtIndex:1];
    self.teamSelected = LOCAL_TEAM;
}

- (IBAction)selectPlayer3:(id)sender {
    [self hiddenBalls];
    self.ballPlayer3.hidden = NO;
    self.playerSelected = [self.aLocalPlayerTeam objectAtIndex:2];
    self.teamSelected = LOCAL_TEAM;
}

- (IBAction)selectPlayer4:(id)sender {
    [self hiddenBalls];
    self.ballPlayer4.hidden = NO;
    self.playerSelected = [self.aLocalPlayerTeam objectAtIndex:3];
    self.teamSelected = LOCAL_TEAM;
}

- (IBAction)selectPlayer5:(id)sender {
    [self hiddenBalls];
    self.ballPlayer5.hidden = NO;
    self.playerSelected = [self.aLocalPlayerTeam objectAtIndex:4];
    self.teamSelected = LOCAL_TEAM;
}

- (IBAction)selectPlayerV1:(id)sender{
    [self hiddenBalls];
    self.ballPlayerV1.hidden = NO;
    self.playerSelected = [self.aVisitorPlayerTeam objectAtIndex:0];
    self.teamSelected = VISITOR_TEAM;
}

- (IBAction)selectPlayerV2:(id)sender{
    [self hiddenBalls];
    self.ballPlayerV2.hidden = NO;
    self.playerSelected = [self.aVisitorPlayerTeam objectAtIndex:1];
    self.teamSelected = VISITOR_TEAM;
}

- (IBAction)selectPlayerV3:(id)sender{
    [self hiddenBalls];
    self.ballPlayerV3.hidden = NO;
    self.playerSelected = [self.aVisitorPlayerTeam objectAtIndex:2];
    self.teamSelected = VISITOR_TEAM;
}

- (IBAction)selectPlayerV4:(id)sender{
    [self hiddenBalls];
    self.ballPlayerV4.hidden = NO;
    self.playerSelected = [self.aVisitorPlayerTeam objectAtIndex:3];
    self.teamSelected = VISITOR_TEAM;
}

- (IBAction)selectPlayerV5:(id)sender{
    [self hiddenBalls];
    self.ballPlayerV5.hidden = NO;
    self.playerSelected = [self.aVisitorPlayerTeam objectAtIndex:4];
    self.teamSelected = VISITOR_TEAM;
}

-(IBAction)basket1:(id)sender{
    NSString *action = @"Tiro personal convertido";
    int points = 1;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Acumulamos puntos en el marcador
    [self sumBookmarkWithPoints:points];
}

-(void)playSound:(NSString *)type{
    self.player = [CafPlayer cafPlayer];

    NSArray *sounds = [self.sounds objectForKey:type];
    int num = (int)arc4random_uniform(sounds.count);
    NSData *dataSound = [sounds objectAtIndex:num];
    
    [self.player playSoundData:dataSound];

}

-(void)saveStatisticsWithAction:(NSString *)anAction points:(int) points {
    if ( self.teamSelected == LOCAL_TEAM || self.teamSelected == VISITOR_TEAM){
        // Localizamos la acción a guardar como estadística
        NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSAction entityName]];
        req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSActionAttributes.name
                                                               ascending:NO
                                                                selector:@selector(caseInsensitiveCompare:)] ];
        req.predicate = [NSPredicate predicateWithFormat:@"name == %@", anAction];
        
        NSArray *fetchedObjects;
        NSError * error = nil;
        fetchedObjects = [self.aGame.managedObjectContext executeFetchRequest:req error:&error];
        
        if (fetchedObjects.count == 1) {
            
            [VOSStatistic statisticWithGame: self.aGame
                                     action: [fetchedObjects objectAtIndex:0]
                                     player: self.playerSelected
                                     period: @([self.game.text intValue])
                                     points: @( points )
                                       time: self.secondsLbl.text
                                    context: self.aGame.managedObjectContext ];
            
        }
    }
}

-(void)sumBookmarkWithPoints:(int) points{
    if ( self.teamSelected == LOCAL_TEAM || self.teamSelected == VISITOR_TEAM){
        // Reproducimos sonido de canasta
        [self playSound:@"canasta"];

        if (self.teamSelected == LOCAL_TEAM) {
            int pointsBookmark = [self.localPoints.text intValue];
            pointsBookmark += points;
            self.localPoints.text = [NSString stringWithFormat:@"%d", pointsBookmark];
            
        }else{
            int pointsBookmark = [self.visitorPoints.text intValue];
            pointsBookmark += points;
            self.visitorPoints.text = [NSString stringWithFormat:@"%d", pointsBookmark];
        }
    }
}

-(IBAction)basket1F:(id)sender{
    NSString *action = @"Tiro personal fallado";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Como es fallo NO Acumulamos puntos en el marcador
    // Reproducimos sonido de rebote
    [self playSound:@"rebote"];

}

-(IBAction)basket2:(id)sender{
    NSString *action = @"Canasta convertida";
    int points = 2;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Acumulamos puntos en el marcador
    [self sumBookmarkWithPoints:points];
    
}

-(IBAction)basket2F:(id)sender{
    NSString *action = @"Canasta fallada";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Reproducimos sonido de rebote
    [self playSound:@"rebote"];

}

-(IBAction)basket3:(id)sender{
    NSString *action = @"Triple convertido";
    int points = 3;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Acumulamos puntos en el marcador
    [self sumBookmarkWithPoints:points];
}

-(IBAction)basket3F:(id)sender{
    NSString *action = @"Triple fallado";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    // Reproducimos sonido de rebote
    [self playSound:@"rebote"];

}

- (IBAction)offensiveRebound:(id)sender {
    NSString *action = @"Rebote ofensivo";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)defensiveRebound:(id)sender {
    NSString *action = @"Rebote en defensa";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)stealBall:(id)sender {
    NSString *action = @"Robo de balón";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)loseBall:(id)sender {
    NSString *action = @"Perdida de balón";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)assistance:(id)sender {
    NSString *action = @"Asistencia";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)block:(id)sender {
    NSString *action = @"Tapón";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)foulReceived:(id)sender {
    NSString *action = @"Falta recibida";
    int points = 0;
    
    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
}

- (IBAction)foul:(id)sender {
    NSString *action = @"Falta cometida";
    int points = 0;

    // Grabamos la estadística correspondiente
    [self saveStatisticsWithAction:action
                            points:points];
    
    if ( self.teamSelected == LOCAL_TEAM || self.teamSelected == VISITOR_TEAM){
        // Reproducimos sonido de falta cuando lo tengamos...
//        [self playSound:@"falta"];
        
        if (self.teamSelected == LOCAL_TEAM) {
            int fouls = [self.localFoul.text intValue];
            fouls += 1;
            self.localFoul.text = [NSString stringWithFormat:@"%d", fouls];

            [self.localFoulStepper setValue:fouls];
            
        }else{
            int fouls = [self.visitorFoul.text intValue];
            fouls += 1;
            self.visitorFoul.text = [NSString stringWithFormat:@"%d", fouls];

            [self.visitorFoulStepper setValue:fouls];
        }
    }
}

- (IBAction)showRecords:(id)sender {
    NSFetchRequest * req = [NSFetchRequest fetchRequestWithEntityName:[VOSStatistic entityName]];
    req.fetchBatchSize = 30;
    req.sortDescriptors = @[ [NSSortDescriptor sortDescriptorWithKey:VOSStatisticAttributes.period
                                                           ascending:NO
                                                            selector:@selector(compare:)],
                             [NSSortDescriptor sortDescriptorWithKey:VOSStatisticAttributes.time
                                                           ascending:YES
                                                            selector:@selector(caseInsensitiveCompare:)] ];
    
    
    req.predicate = [NSPredicate predicateWithFormat:@"game == %@", self.aGame];
    NSFetchedResultsController * frcStatistics = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                               managedObjectContext:self.aGame.managedObjectContext
                                                                                 sectionNameKeyPath:@"period"
                                                                                          cacheName:nil ];
    
    
    
    // Creamos el nuevo controlador y le pasamos el nombre del Club que lo sepa
    VOSStatisticsViewController * statisticsVC = [[VOSStatisticsViewController alloc] initWithFetchedResultsController:frcStatistics
                                                                                                  club:self.aGame
                                                                                                 style:UITableViewStylePlain];
    // Lo pusheo
    [self.navigationController pushViewController:statisticsVC
                                         animated:YES];

    
}


#pragma mark - EditTeam
- (IBAction)editLocalTeam:(id)sender {
    
    VOSTeam * team = self.aGame.homeTeam;
    [self manageTeam:team];
}

- (IBAction)editVisitorTeam:(id)sender {
    VOSTeam * team = self.aGame.awayTeam;
    [self manageTeam:team];
}

-(void)manageTeam:(VOSTeam *)team{
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

#pragma mark - EditAlignment
- (IBAction)selectCrew:(id)sender {

    // Seleccionamos el equipo del que tenemos que mostrar los jugadores
    VOSTeam *team = self.aGame.homeTeam;
    [self manageCrew:team aCrew:self.aLocalPlayerTeam];

}

- (IBAction)selectVisitorCrew:(id)sender {
    // Seleccionamos el equipo del que tenemos que mostrar los jugadores
    VOSTeam *team = self.aGame.awayTeam;
    [self manageCrew:team aCrew:self.aVisitorPlayerTeam];
}

-(void)manageCrew:(VOSTeam *)team aCrew:(NSMutableArray *) crew{
    
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
                                                                                                          aCrew:crew
                                                                                                          style:UITableViewStylePlain];
    // Lo pusheo
    [self.navigationController pushViewController:crewVC
                                         animated:YES];
    
    
}

@end
