//
//  VOSTeamsViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSClub;

@interface VOSTeamsViewController : VOSCoreDataTableViewController

@property (strong, nonatomic) VOSClub *clubEdit;

-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           club:(VOSClub *) aClub
                                          style:(UITableViewStyle) aStyle;


@end
