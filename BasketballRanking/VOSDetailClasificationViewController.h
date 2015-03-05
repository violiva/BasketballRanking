//
//  VOSDetailClasificationViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 4/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSClasification;
@class VOSGroup;

@interface VOSDetailClasificationViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *groupLbl;
@property (weak, nonatomic) IBOutlet UIButton *btnTeam;
@property (weak, nonatomic) IBOutlet UITextField *gPlayed;
@property (weak, nonatomic) IBOutlet UITextField *gWon;
@property (weak, nonatomic) IBOutlet UITextField *gTied;
@property (weak, nonatomic) IBOutlet UITextField *gLost;
@property (weak, nonatomic) IBOutlet UITextField *pForUs;
@property (weak, nonatomic) IBOutlet UITextField *pAgainst;
@property (weak, nonatomic) IBOutlet UITextField *pDif;
@property (weak, nonatomic) IBOutlet UITextField *pTotal;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerTeam;
@property (weak, nonatomic) IBOutlet UILabel *teamText;

@property (nonatomic, strong) VOSClasification * clasif;

- (IBAction)setTeam:(id)sender;

-(id) initWithModel:(id) model;
-(id) initForNewClasificationforGroup: (VOSGroup *) group;

@end
