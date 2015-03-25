//
//  VOSMatchViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 20/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSGame;
@class VOSPlayer;

@interface VOSMatchViewController : UIViewController

@property (nonatomic, strong) VOSGame * aGame;
@property (nonatomic, strong) NSTimer *counter;
@property (nonatomic) int seconds;
@property (weak, nonatomic) IBOutlet UILabel *secondsLbl;

@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *pauseBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIButton *restartBtn;

@property (weak, nonatomic) IBOutlet UILabel *game;
@property (weak, nonatomic) IBOutlet UILabel *localPoints;
@property (weak, nonatomic) IBOutlet UILabel *visitorPoints;

@property (weak, nonatomic) IBOutlet UILabel *localTeam;
@property (weak, nonatomic) IBOutlet UILabel *visitorTeam;

@property (nonatomic, strong) NSMutableArray *aLocalPlayerTeam;
@property (nonatomic, strong) NSMutableArray *aVisitorPlayerTeam;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayer1;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayer1;
@property (weak, nonatomic) IBOutlet UILabel *namePlayer1;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayer1;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayer2;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayer2;
@property (weak, nonatomic) IBOutlet UILabel *namePlayer2;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayer2;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayer3;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayer3;
@property (weak, nonatomic) IBOutlet UILabel *namePlayer3;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayer3;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayer4;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayer4;
@property (weak, nonatomic) IBOutlet UILabel *namePlayer4;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayer4;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayer5;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayer5;
@property (weak, nonatomic) IBOutlet UILabel *namePlayer5;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayer5;

@property (weak, nonatomic) IBOutlet UIView *player1;
@property (weak, nonatomic) IBOutlet UIView *player2;
@property (weak, nonatomic) IBOutlet UIView *player3;
@property (weak, nonatomic) IBOutlet UIView *player4;
@property (weak, nonatomic) IBOutlet UIView *player5;


@property (weak, nonatomic) IBOutlet UIView *playerV1;
@property (weak, nonatomic) IBOutlet UIView *playerV2;
@property (weak, nonatomic) IBOutlet UIView *playerV3;
@property (weak, nonatomic) IBOutlet UIView *playerV4;
@property (weak, nonatomic) IBOutlet UIView *playerV5;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayerV1;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayerV1;
@property (weak, nonatomic) IBOutlet UILabel *namePlayerV1;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayerV1;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayerV2;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayerV2;
@property (weak, nonatomic) IBOutlet UILabel *namePlayerV2;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayerV2;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayerV3;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayerV3;
@property (weak, nonatomic) IBOutlet UILabel *namePlayerV3;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayerV3;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayerV4;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayerV4;
@property (weak, nonatomic) IBOutlet UILabel *namePlayerV4;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayerV4;

@property (weak, nonatomic) IBOutlet UIImageView *photoPlayerV5;
@property (weak, nonatomic) IBOutlet UILabel *dorsalPlayerV5;
@property (weak, nonatomic) IBOutlet UILabel *namePlayerV5;
@property (weak, nonatomic) IBOutlet UIImageView *ballPlayerV5;

@property (nonatomic) int teamSelected;
@property (nonatomic, strong) VOSPlayer *playerSelected;

- (IBAction)selectPlayer1:(id)sender;
- (IBAction)selectPlayer2:(id)sender;
- (IBAction)selectPlayer3:(id)sender;
- (IBAction)selectPlayer4:(id)sender;
- (IBAction)selectPlayer5:(id)sender;

- (IBAction)selectPlayerV1:(id)sender;
- (IBAction)selectPlayerV2:(id)sender;
- (IBAction)selectPlayerV3:(id)sender;
- (IBAction)selectPlayerV4:(id)sender;
- (IBAction)selectPlayerV5:(id)sender;

- (IBAction)basket1:(id)sender;
- (IBAction)basket1F:(id)sender;
- (IBAction)basket2:(id)sender;
- (IBAction)basket2F:(id)sender;
- (IBAction)basket3:(id)sender;
- (IBAction)basket3F:(id)sender;
- (IBAction)offensiveRebound:(id)sender;
- (IBAction)defensiveRebound:(id)sender;
- (IBAction)stealBall:(id)sender;
- (IBAction)loseBall:(id)sender;
- (IBAction)assistance:(id)sender;
- (IBAction)block:(id)sender;
- (IBAction)foulReceived:(id)sender;
- (IBAction)foul:(id)sender;



-(id) initWithGame:(VOSGame *) aGame;

- (IBAction)editLocalTeam:(id)sender;
- (IBAction)selectCrew:(id)sender;

- (IBAction)editVisitorTeam:(id)sender;
- (IBAction)selectVisitorCrew:(id)sender;

-(IBAction)start:(id)sender;
-(IBAction)pause:(id)sender;
-(IBAction)stop:(id)sender;
-(IBAction)restart:(id)sender;

-(IBAction)gameChanged:(id)sender;

@end
