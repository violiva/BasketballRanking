//
//  VOSSelectCrewViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSTeam;

@interface VOSSelectCrewViewController : VOSCoreDataTableViewController

@property (nonatomic, strong) VOSTeam *team;
@property (nonatomic, strong) NSMutableArray *pickedCrew;


-(id) initWithFetchedResultsController: (NSFetchedResultsController *) aFetchedResultsController
                                  team:(VOSTeam *) aTeam
                                 aCrew:(NSMutableArray *) aCrew
                                 style: (UITableViewStyle) aStyle;

@end