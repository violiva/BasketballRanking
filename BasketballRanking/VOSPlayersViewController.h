//
//  VOSPlayersViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
#import "VOSTeam.h"

@interface VOSPlayersViewController : VOSCoreDataTableViewController

@property (strong, nonatomic) VOSTeam *teamEdit;

-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           team:(VOSTeam *) aTeam
                                          style:(UITableViewStyle) aStyle;

@end
