//
//  VOSPlayerPhotoTableViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@class UIKit;
@class VOSPlayer;

@interface VOSPlayerPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) VOSPlayer * player;


+(CGFloat)height;
+(NSString *)cellId;

@end
