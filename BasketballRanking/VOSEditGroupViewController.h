//
//  VOSEditGroupViewController.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSGroup;

@interface VOSEditGroupViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) VOSGroup * group;

-(id) initWithModel:(VOSGroup *) model;

@end
