//
//  VOSPlayerCollectionViewCell.h
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 27/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VOSPlayer;

@interface VOSPlayerCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;
@property (weak, nonatomic) IBOutlet UILabel *dorsalView;

-(void)observePlayer:(VOSPlayer *) player;

@end
