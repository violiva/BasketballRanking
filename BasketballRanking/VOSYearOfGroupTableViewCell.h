//
//  VOSYearOfGroupTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 23/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSGroup;


@interface VOSYearOfGroupTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *yearView;
@property (nonatomic, strong) VOSGroup *group;

+(CGFloat)height;
+(NSString *)cellId;

@end