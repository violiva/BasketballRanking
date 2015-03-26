//
//  CafPlayer.m
//  Character
//
//  Created by Fernando Rodríguez Romero on 9/22/11.
//  Copyright 2011 AGBO Business Architecture, SL. All rights reserved.
//  
//  Para más info, mira mi blog:
//  http://www.cocoaosx.com/2011/06/20/como-reproducir-sonidos-en-ios/
//

#import "CafPlayer.h"

@implementation CafPlayer
@synthesize player;

+(id) cafPlayer{
    // Un inicializador de clase. Lo usamos por comodidad.
    return [[[self class] alloc] init];
}

-(void) playSoundData: (NSData *) data{
    // err nos indicará si ha habido algún error
    // ver la diapositiva sobre excepciones y errores
    // en cocoa
    NSError *err = nil;
    
    // Hay que crear un nuevo player para cada reproducción:
    // es inmutable
    self.player = [[AVAudioPlayer alloc] initWithData:data error:&err];
    self.player.numberOfLoops = 0; // ningún loop, solo suena una vez. -1 haría que sonase para siempre
    
    if(err){
        // Hubo un error:
        NSLog(@"Error al reproducir el sonido: %@", err);
    }else{
        [self.player play];
    }

}
-(void) playFile:(NSURL *) aSoundFile{
    
    // NSData representa un buffer de datos. Se usa para leer archivos
    // binarios o para recibir datos binarios de la red.
    NSData *soundData = [NSData dataWithContentsOfURL:aSoundFile];
    
    [self playSoundData:soundData];
    }
@end
