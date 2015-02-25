//
//  VOSPlayerDorsalTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSPlayer;

@interface VOSPlayerDorsalTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dorsalView;
@property (nonatomic, strong) VOSPlayer *player;

+(CGFloat) height;
+(NSString *) cellId;

@end
