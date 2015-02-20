//
//  VOSClubDirectionTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSClub.h"

@interface VOSClubDirectionTableViewCell : UITableViewCell <UITextViewDelegate>

+(CGFloat) height;
+(NSString *) cellId;

@property (weak, nonatomic) IBOutlet UITextView *addressField;
@property (nonatomic, strong) VOSClub * club;

@end
