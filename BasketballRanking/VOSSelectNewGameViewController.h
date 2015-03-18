//
//  VOSSelectNewGameViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 16/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//
@class UIkit;
@class VOSGame;
@class VOSGroup;
@class VOSTeam;

#import <UIKit/UIKit.h>

@interface VOSSelectNewGameViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *matchDateLbl;
@property (weak, nonatomic) IBOutlet UIButton *groupLbl;
@property (weak, nonatomic) IBOutlet UIButton *localTeamLbl;
@property (weak, nonatomic) IBOutlet UIButton *visitorTeamLbl;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIDatePicker *pickerDate;

@property (nonatomic, strong) NSDate * aDate;
@property (nonatomic, strong) VOSGame * aGame;
@property (nonatomic, strong) VOSGroup * aGroup;
@property (nonatomic, strong) VOSTeam * aLocalTeam;
@property (nonatomic, strong) VOSTeam * aVisitorTeam;

- (IBAction)matchDateBtn:(id)sender;
- (IBAction)groupBtn:(id)sender;
- (IBAction)localTeamBtn:(id)sender;
- (IBAction)visitorTeamBtn:(id)sender;
- (IBAction)CancelBtn:(id)sender;
- (IBAction)doneBtn:(id)sender;

-(instancetype)initWithGroup:(VOSGroup *) aGroup;

-(id) initWithModel:(id) model;
-(id) initForNewGame: (VOSGroup *) group;

@end
