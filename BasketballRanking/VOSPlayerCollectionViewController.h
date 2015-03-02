//
//  VOSPlayerCollectionViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 27/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSCoreDataCollectionViewController.h"
@class VOSTeam;

@interface VOSPlayerCollectionViewController : VOSCoreDataCollectionViewController
@property (nonatomic, strong) VOSTeam *team;

@end
