//
//  VOSEditPlayerViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 25/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
#import "VOSPlayer.h"

@interface VOSEditPlayerViewController : UITableViewController

@property (nonatomic, strong) VOSPlayer * player;

-(id) initWithModel:(VOSPlayer *) model;

@end