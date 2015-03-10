//
//  VOSTeamsInAGroupViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSGroup;

@interface VOSTeamsInAGroupViewController : VOSCoreDataTableViewController // <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) VOSGroup *aGroup;
@property (nonatomic, strong) NSMutableSet *pickedTeams;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

-(instancetype)initWithFetchedResultsController:(NSFetchedResultsController *) aFetchedResultsController
                                           group:(VOSGroup *) group
                                          style:(UITableViewStyle) aStyle;



@end
