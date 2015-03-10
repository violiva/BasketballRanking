//
//  VOSTeamsListViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSGroup;

@interface VOSTeamsListViewController : VOSCoreDataTableViewController

@property (nonatomic, strong) VOSGroup *group;
@property (nonatomic, strong) NSMutableSet *pickedTeams;

@end
