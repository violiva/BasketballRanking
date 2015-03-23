//
//  VOSMatchViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 20/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSGame;

@interface VOSMatchViewController : UIViewController

@property (nonatomic, strong) VOSGame * aGame;
@property (nonatomic, strong) NSTimer *counter;
@property (nonatomic) int seconds;
@property (weak, nonatomic) IBOutlet UILabel *secondsLbl;

@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIButton *restartBtn;

- (IBAction)editLocalTeam:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *localTeam;
@property (weak, nonatomic) IBOutlet UILabel *visitorTeam;


@property (nonatomic, strong) NSMutableArray *aLocalPlayerTeam;


- (IBAction)selectCrew:(id)sender;


-(id) initWithGame:(VOSGame *) aGame;

-(IBAction)start:(id)sender;
-(IBAction)pause:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)restart:(id)sender;

@end
