//
//  VOSGroupTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSGroup;

@interface VOSGroupTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *groupNameView;
@property (nonatomic, strong) VOSGroup *group;

+(CGFloat)height;
+(NSString *)cellId;

@end
