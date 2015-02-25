//
//  VOSPlayerNameTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VOSPlayer;

@interface VOSPlayerNameTableViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *namePlayerView;

@property (nonatomic, strong) VOSPlayer * player;

+(CGFloat) height;
+(NSString *) cellId;

@end
