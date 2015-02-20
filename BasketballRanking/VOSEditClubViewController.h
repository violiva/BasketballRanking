//
//  VOSEditClubViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
@class VOSClub;

@interface VOSEditClubViewController : UITableViewController

@property (nonatomic, strong) VOSClub * club;

-(id) initWithModel:(VOSClub *) model;

@end
