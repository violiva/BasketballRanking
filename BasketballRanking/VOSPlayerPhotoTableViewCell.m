//
//  VOSPlayerPhotoTableViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 24/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPlayerPhotoTableViewCell.h"
#import "VOSPlayer.h"
#import "VOSPhotoContainer.h"

@implementation VOSPlayerPhotoTableViewCell

#pragma mark - Properties
-(void) setPlayer:(VOSPlayer *)player{
    //guardamos el jugador
    _player = player;
    
    // sincronizamos los datos de la nota con la vista
    if ( player.photo.image ){
        self.photoView.image = player.photo.image;
    }
}

+(CGFloat)height{
    return 320.0f;
}

+(NSString *)cellId{
    return [self description];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
