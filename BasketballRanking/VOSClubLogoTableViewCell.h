//
//  VOSClubLogoTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 19/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSClub;

@interface VOSClubLogoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoClub;
@property (strong, nonatomic) VOSClub * club;

- (IBAction)btnAction:(id)sender;

+(CGFloat)height;
+(NSString *)cellId;

@end
