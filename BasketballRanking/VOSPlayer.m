#import "VOSPlayer.h"
#import "VOSTeam.h"
#import "VOSPhotoContainer.h"

@interface VOSPlayer ()

// Private interface goes here.

@end

@implementation VOSPlayer

// Custom logic goes here.
+(instancetype) playerWithName:(NSString *) name
                          team:(VOSTeam *) team
                       context:(NSManagedObjectContext *) context{
    
    VOSPlayer * player = [self insertInManagedObjectContext:context];
    player.name = name;
    player.team = team;

    player.photo.photo = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Silueta_Jugador"
                                                                                withExtension:@"jpg"]];
    return player;
}

#pragma mark - Util
-(NSArray *) observableKeys{
    return @[VOSPlayerAttributes.name,
             VOSPlayerAttributes.dorsal,
             VOSPlayerRelationships.team,
             VOSPlayerRelationships.photo];
}

@end
