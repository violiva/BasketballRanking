//
//  CafPlayer.h
//  Character
//
//  Created by Fernando Rodríguez Romero on 9/22/11.
//  Copyright 2011 AGBO Business Architecture, SL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface CafPlayer : NSObject {
    
}

@property (retain) AVAudioPlayer *player;

+(id) cafPlayer;

-(void) playFile:(NSURL *) aSoundFile;
-(void) playSoundData: (NSData *) data;
@end
