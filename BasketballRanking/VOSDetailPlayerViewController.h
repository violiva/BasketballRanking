//
//  VOSDetailPlayerViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 1/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
#import "VOSDetailViewController.h"

@class VOSPlayer;
@class VOSTeam;

@interface VOSDetailPlayerViewController : UIViewController <VOSDetailViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *playerNameView;
@property (weak, nonatomic) IBOutlet UITextField *dorsalView;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(id) initWithModel:(id) model;
-(id) initForNewPlayerInTeam: (VOSTeam *) team;

@end
