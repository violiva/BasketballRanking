//
//  VOSClubNameTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSClub.h"

@interface VOSClubNameTableViewCell : UITableViewCell <UITextFieldDelegate>

+(CGFloat) height;
+(NSString *) cellId;

@property (weak, nonatomic) IBOutlet UITextField * nameField;
@property (nonatomic, strong) VOSClub * club;

@end
