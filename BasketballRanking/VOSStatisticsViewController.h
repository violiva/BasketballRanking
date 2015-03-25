//
//  VOSStatisticsViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 25/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSGame;

@interface VOSStatisticsViewController : VOSCoreDataTableViewController

@property (strong, nonatomic) VOSGame *game;


-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           club:(VOSGame *) aGame
                                          style:(UITableViewStyle) aStyle;

@end
