//
//  VOSTeamsInAGroupTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 10/3/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSGroup;

@interface VOSTeamsInAGroupTableViewCell : UITableViewCell // <UITextViewDelegate>

@property (nonatomic, strong) VOSGroup *group;
@property (weak, nonatomic) IBOutlet UILabel *teams;

+(CGFloat)height;
+(NSString *)cellId;

@end