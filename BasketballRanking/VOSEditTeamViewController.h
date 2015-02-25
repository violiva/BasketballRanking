//
//  VOSEditTeamViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSTeam.h"

@interface VOSEditTeamViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *teamView;
@property (weak, nonatomic) IBOutlet UITextField *colourView;
@property (weak, nonatomic) IBOutlet UITextField *yearView;

@property (strong, nonatomic) VOSTeam *team;

-(id) initWithModel: (VOSTeam *) aModel;

@end
