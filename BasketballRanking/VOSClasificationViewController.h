//
//  VOSClasificationViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 4/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataTableViewController.h"
@class VOSGroup;

@interface VOSClasificationViewController : VOSCoreDataTableViewController
@property (strong, nonatomic) VOSGroup * group;

@end
