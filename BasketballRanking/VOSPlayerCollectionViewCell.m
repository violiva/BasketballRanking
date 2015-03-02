//
//  VOSPlayerCollectionViewCell.m
//  BasketballRanking
//
//  Created by Vicente Oliva de la Serna on 27/2/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSPlayerCollectionViewCell.h"
#import "VOSPlayer.h"
#import "VOSPhotoContainer.h"

@interface VOSPlayerCollectionViewCell ()

@property (strong, nonatomic) VOSPlayer * player;

@end

@implementation VOSPlayerCollectionViewCell

+(NSArray *)keys{
    return @[@"name", @"dorsal", @"photo.image"];
}

-(void)observePlayer:(VOSPlayer *) player{

    // guardarla en la propiedad
    self.player = player;
    
    // observar ciertas propiedades
    for ( NSString *key in [VOSPlayerCollectionViewCell keys] ){
        [self.player addObserver:self
                      forKeyPath:key
                         options:NSKeyValueObservingOptionNew
                         context:NULL];
    }
    [self syncWithPlayer];
}

-(void)syncWithPlayer{
    self.nameView.text = self.player.name;
    self.dorsalView.text = [NSString stringWithFormat:@"%@", self.player.dorsal];

    UIImage *img = nil;
    if (self.player.photo.image == nil){
        img = [UIImage imageNamed:@"Player_Jumping.png"];
    }else{
        img = self.player.photo.image;
    }
    self.photoView.image = img;
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    [self syncWithPlayer];
}

-(void)prepareForReuse{
    
    self.player = nil;
    [self syncWithPlayer];
    
}

@end
