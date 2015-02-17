//
//  VOSActionTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 17/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSAction;

@interface VOSActionTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *actionNameView;
@property (nonatomic, strong) VOSAction *action;

+(CGFloat)height;
+(NSString *)cellId;

@end
